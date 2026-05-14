import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {

  static Future<void> salvarTema(bool darkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', darkMode);
  }

  static Future<bool> carregarTema() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkMode') ?? false;
  }

  static Future<void> salvarIdioma(String idioma) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('idioma', idioma);
  }

  static Future<String> carregarIdioma() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('idioma') ?? 'Português';
  }

  static Future<void> salvarNotificacao(bool valor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificacao', valor);
  }

  static Future<bool> carregarNotificacao() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notificacao') ?? true;
  }
}