// main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(DepartmentApp(isDarkMode: isDarkMode));
}

class DepartmentApp extends StatefulWidget {
  final bool isDarkMode;

  const DepartmentApp({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<DepartmentApp> createState() => _DepartmentAppState();
}

class _DepartmentAppState extends State<DepartmentApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
    print('Theme toggled to: $_themeMode'); // Debug print
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Department App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      themeMode: _themeMode,
      home: LoginPage(
        onThemeChanged: _toggleTheme,
        themeMode: _themeMode,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}