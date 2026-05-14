import 'package:shared_preferences/shared_preferences.dart';

class MigrationService {

  static Future<void> verificarMigracao() async {

    final prefs = await SharedPreferences.getInstance();

    final versao = prefs.getInt('versao_dados') ?? 1;

    if(versao == 1){

      // migração fictícia

      await prefs.setInt('versao_dados', 2);
    }
  }
}