# Localvault-MatheusSoster

Aluno: Matheus Henrique Soster

Turma: ADS 5 fase 2026

1. Por que foi escolhido SharedPreferences?

O SharedPreferences foi utilizado para salvar configurações simples do aplicativo, como:

modo escuro
idioma
notificações

Ele é leve, simples e ideal para pequenas preferências persistentes.

2. Por que foi escolhido Hive?

O Hive foi utilizado para armazenar o perfil do usuário porque possui:

alta performance
armazenamento local rápido
suporte a objetos personalizados com TypeAdapter

Além disso, funciona bem offline.

3. Por que foi escolhido flutter_secure_storage?

O flutter_secure_storage foi utilizado para armazenar o token de forma segura.

Ele utiliza os sistemas de segurança nativos do Android e iOS, protegendo dados sensíveis.

4. Como rodar o projeto

Instale as dependências:

flutter pub get

Execute o projeto:

flutter run

5. Funcionalidades
Persistência de configurações
Tema claro/escuro
Alteração de idioma
Cadastro de perfil
Exclusão de perfil
Armazenamento seguro de token
Migração simples de dados

6. Coleta e Exclusão de Dados

Se o aplicativo fosse publicado na Play Store, os seguintes dados poderiam ser armazenados localmente:

Nome do usuário
E-mail
Idade
Preferências do aplicativo (tema, idioma e notificações)
Token de autenticação fictício

Os dados seriam utilizados apenas para funcionamento interno do aplicativo e personalização da experiência do usuário.

Para garantir transparência ao usuário, o aplicativo deve apresentar uma política de privacidade informando:

quais dados são armazenados
finalidade dos dados
onde os dados ficam salvos
como o usuário pode removê-los

O aplicativo também possui a função “Apagar Perfil”, permitindo que o usuário exclua seus dados locais a qualquer momento, seguindo os princípios da LGPD relacionados ao direito de exclusão de dados.

Imagem:

A imagem abaixo mostra a tela principal com as configurações de "Modo Escuro" ativo e com a língua em inglês.
<img width="924" height="826" alt="image" src="https://github.com/user-attachments/assets/2f0ff9df-1d8c-46eb-a32f-01bf3615956d" />
