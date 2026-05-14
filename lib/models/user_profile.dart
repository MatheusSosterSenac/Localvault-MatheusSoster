import 'package:hive/hive.dart';

part '../adapters/user_profile.g.dart';

@HiveType(typeId: 0)
class UserProfile extends HiveObject {

  @HiveField(0)
  String nome;

  @HiveField(1)
  String email;

  @HiveField(2)
  int idade;

  @HiveField(3)
  String dataCadastro;

  UserProfile({
    required this.nome,
    required this.email,
    required this.idade,
    required this.dataCadastro,
  });
}