import '../main.dart';

import 'package:flutter/material.dart';

import '../services/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool darkMode = false;
  bool notificacao = true;

  String idioma = 'Português';

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {

    darkMode = await SettingsService.carregarTema();
    notificacao = await SettingsService.carregarNotificacao();
    idioma = await SettingsService.carregarIdioma();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            SwitchListTile(
              title: const Text('Modo Escuro'),
              value: darkMode,

              onChanged: (value) async {

                setState(() {
                  darkMode = value;
                });

                await SettingsService.salvarTema(value);

                MyApp.of(context)?.alterarTema(value);
              },
            ),

            DropdownButton<String>(
              value: idioma,

              items: const [

                DropdownMenuItem(
                  value: 'Português',
                  child: Text('Português'),
                ),

                DropdownMenuItem(
                  value: 'Inglês',
                  child: Text('Inglês'),
                ),
              ],

              onChanged: (value) async {

                if(value != null){

                  setState(() {
                    idioma = value;
                  });

                  await SettingsService.salvarIdioma(value);

                  MyApp.of(context)?.alterarIdioma(value);
                }
              },
            ),

            SwitchListTile(
              title: const Text('Notificações'),
              value: notificacao,

              onChanged: (value) async {

                setState(() {
                  notificacao = value;
                });

                await SettingsService.salvarNotificacao(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}