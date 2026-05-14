import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {

  final String idioma;

  const HomeScreen({
    super.key,
    required this.idioma,
  });

  @override
  Widget build(BuildContext context) {

    final bool ingles = idioma == 'Inglês';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ingles
              ? 'LocalVault'
              : 'LocalVault',
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsScreen(),
                  ),
                );
              },

              child: Text(
                ingles
                    ? 'Settings'
                    : 'Configurações',
              ),
            ),

            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },

              child: Text(
                ingles
                    ? 'Profile'
                    : 'Perfil',
              ),
            ),
          ],
        ),
      ),
    );
  }
}