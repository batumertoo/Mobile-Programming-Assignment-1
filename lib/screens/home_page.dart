// screens/home_page.dart
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'people_page.dart';
import 'infrastructure_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode themeMode;

  const HomePage({
    Key? key,
    required this.onThemeChanged,
    required this.themeMode,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const PeoplePage(),
      const InfrastructurePage(),
      ProfilePage(
        onThemeChanged: widget.onThemeChanged,
        themeMode: widget.themeMode,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Department App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(
                    onThemeChanged: widget.onThemeChanged,
                    themeMode: widget.themeMode,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Infrastructure',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}