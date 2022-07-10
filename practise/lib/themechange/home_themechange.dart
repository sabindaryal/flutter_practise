import 'package:flutter/material.dart';
import 'package:practise/themechange/themeprefer.dart';

class homeThemeChange extends StatefulWidget {
  const homeThemeChange({Key? key}) : super(key: key);

  @override
  State<homeThemeChange> createState() => _homeThemeChangeState();
}

class _homeThemeChangeState extends State<homeThemeChange> {
  late bool _isDark = false;
  ThemePre _preferences = ThemePre();
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePre();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: SafeArea(child: Column(children: const [Text('change theme')])));
  }
}
