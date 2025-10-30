// screens/profile_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode themeMode;

  const ProfilePage({
    Key? key,
    required this.onThemeChanged,
    required this.themeMode,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();

  bool _isEditing = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _bioController.text = prefs.getString('bio') ?? '';
      _isLoading = false;
    });
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('bio', _bioController.text);

    setState(() => _isEditing = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Get current theme from context to ensure we have the latest state
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Picture
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    _usernameController.text.isNotEmpty
                        ? _usernameController.text[0].toUpperCase()
                        : 'U',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (_isEditing)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, size: 20),
                        color: Colors.white,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Photo upload coming soon!'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),

            // Edit/Save Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    if (_isEditing) {
                      _saveProfile();
                    } else {
                      setState(() => _isEditing = true);
                    }
                  },
                  icon: Icon(_isEditing ? Icons.save : Icons.edit),
                  label: Text(_isEditing ? 'Save Profile' : 'Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
                if (_isEditing) ...[
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                        _loadProfile();
                      });
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 32),

            // Profile Fields
            _buildProfileField(
              controller: _usernameController,
              label: 'Username',
              icon: Icons.person,
              enabled: _isEditing,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            _buildProfileField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
              enabled: _isEditing,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            _buildProfileField(
              controller: _phoneController,
              label: 'Phone Number',
              icon: Icons.phone,
              enabled: _isEditing,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            _buildProfileField(
              controller: _bioController,
              label: 'Bio',
              icon: Icons.info,
              enabled: _isEditing,
              maxLines: 3,
            ),
            const SizedBox(height: 32),

            // Theme Toggle Card
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  isDarkMode ? 'Enabled' : 'Disabled',
                ),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    widget.onThemeChanged(value);
                    SharedPreferences.getInstance().then((prefs) {
                      prefs.setBool('isDarkMode', value);
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Account Info Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Information',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(Icons.person_outline, 'Account Type', 'Student'),
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.calendar_today, 'Member Since', '2024'),
                    const SizedBox(height: 8),
                    _buildInfoRow(Icons.verified, 'Status', 'Active'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool enabled,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      enabled: enabled,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.black54,
        ),
        prefixIcon: Icon(
          icon,
          color: isDark ? Colors.white70 : Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.white30 : Colors.grey.shade400,
          ),
        ),
        filled: !enabled,
        fillColor: enabled
            ? null
            : (isDark ? Colors.grey.shade800 : Colors.grey.shade100),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: isDark ? Colors.white70 : Colors.grey.shade600,
        ),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white70 : Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }
}