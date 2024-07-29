import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  int _selectedThemeIndex = 0;

  ThemePreferences(this._selectedThemeIndex);

  int get currentTheme => _selectedThemeIndex;

  Future updateTheme(int index) async {
    _selectedThemeIndex = index;
    await _updateThemeInDb(index);
  }

  _updateThemeInDb(int index) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt("current_theme", index);
  }

  Future getThemeFromDb() async {
    final preferences = await SharedPreferences.getInstance();
    _selectedThemeIndex = preferences.getInt("current_theme") ?? 0;
  }
}
