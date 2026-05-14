import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/user_profile.dart';
import '../services/storage_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final idadeController = TextEditingController();

  final tokenController = TextEditingController();

  Future<void> salvarPerfil() async {

    final box = Hive.box<UserProfile>('profileBox');

    final profile = UserProfile(
      nome: nomeController.text,
      email: emailController.text,
      idade: int.parse(idadeController.text),
      dataCadastro: DateTime.now().toString(),
    );

    await box.put('perfil', profile);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Perfil salvo'),
      ),
    );
  }

  Future<void> carregarPerfil() async {

    final box = Hive.box<UserProfile>('profileBox');

    final profile = box.get('perfil');

    if(profile != null){

      nomeController.text = profile.nome;
      emailController.text = profile.email;
      idadeController.text = profile.idade.toString();

      setState(() {});
    }
  }

  Future<void> deletarPerfil() async {

    final box = Hive.box<UserProfile>('profileBox');

    await box.delete('perfil');

    nomeController.clear();
    emailController.clear();
    idadeController.clear();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carregarPerfil();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),

              TextField(
                controller: idadeController,
                decoration: const InputDecoration(
                  labelText: 'Idade',
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: salvarPerfil,
                child: const Text('Salvar Perfil'),
              ),

              ElevatedButton(
                onPressed: deletarPerfil,
                child: const Text('Apagar Perfil'),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: tokenController,
                decoration: const InputDecoration(
                  labelText: 'Token',
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {

                  await StorageService.salvarToken(
                    tokenController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Token salvo'),
                    ),
                  );
                },

                child: const Text('Salvar Token'),
              ),

              ElevatedButton(
                onPressed: () async {

                  final token = await StorageService.lerToken();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(token ?? 'Nenhum token'),
                    ),
                  );
                },

                child: const Text('Ler Token'),
              ),

              ElevatedButton(
                onPressed: () async {

                  await StorageService.deletarToken();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Token deletado'),
                    ),
                  );
                },

                child: const Text('Deletar Token'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}