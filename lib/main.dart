import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user_profile.dart';
import 'screens/home_screen.dart';
import 'services/migration_service.dart';
import 'services/settings_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserProfileAdapter());

  await Hive.openBox<UserProfile>('profileBox');

  await MigrationService.verificarMigracao();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool darkMode = false;
  String idioma = 'Português';

  @override
  void initState() {
    super.initState();
    carregarConfiguracoes();
  }

  Future<void> carregarConfiguracoes() async {

    darkMode = await SettingsService.carregarTema();

    idioma = await SettingsService.carregarIdioma();

    setState(() {});
  }

  void alterarTema(bool value) {

    setState(() {
      darkMode = value;
    });
  }

  void alterarIdioma(String value) {

    setState(() {
      idioma = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: darkMode
          ? ThemeMode.dark
          : ThemeMode.light,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),

      home: HomeScreen(
        idioma: idioma,
      ),
    );
  }
}