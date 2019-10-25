import 'dart:async';
import 'theme_provider.dart';
import '../models/theme_model.dart';

class Repository {
  final themeProvider = ThemeProvider();

  Future<ThemeModel> fetchAllThemes() => themeProvider.fetchThemeList();
}