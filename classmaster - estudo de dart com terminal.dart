// =============================================================================================
// SISTEMA CLASSMASTER - GERENCIAMENTO SIMPLIFICADO DE NOTAS
// Desenvolvido por: Arthur Menezes
// Versão: 1.0.0
// Data de Criação: 14/12/2024
// Descrição: Este programa é uma aplicação para terminal, desenvolvida em Dart,
// que permite uma simulação de cadastro e login de usuário, e input de notas 
// em um sistema fictício.
//
// Tecnologias utilizadas:
// - Linguagem Dart
// - Biblioteca dart:io para interação com o terminal
//
// Propósito: Estudo básico de lógica utilizando a linguagem Dart.
// 
// Observações:
// Para captar os dados através dos inputs no terminal, devemos utilizar a biblioteca 'dart.io'.
// Essa biblioteca faz parte do SDK (kit de desenvolvimento) de aplicativos Dart que rodam
// em situações como: terminais e manipulação no sistema de arquivos em SO's (desktop). 
// Caso o software esteja rodando em ambientes web ou mobile (Flutter), deve ser utilizada
// uma API no caso da web, e widgets do Flutter quando em mobile.
// =============================================================================================

import 'dart:io';

void main() {
  // Listas para armazenar os usuários e as senhas
  List<String> listaUsuarios = [];
  List<String> listaSenhas = [];

  // Solicitar cadastro de novo usuário
  print("Olá, bem-vindo(a) ao seu primeiro acesso ao sistema ClassMaster.\n\nÁREA DE CADASTRO\nCrie um usuário de acesso para você.\n\nDigite um nome de usuário e pressione ENTER: ");
  String? novoUsuario = stdin.readLineSync();

  // Solicitar a senha para o novo usuário
  print("\nDigite uma senha e pressione ENTER: ");
  String? novaSenha = stdin.readLineSync();

  // Adicionar usuário e senha às listas
  listaUsuarios.add(novoUsuario!);
  listaSenhas.add(novaSenha!);

  print("\nObrigado por criar uma conta conosco, aproveite o seu sistema ao máximo.");
  print("Lembre-se, seu usuário é $listaUsuarios, e a sua senha é $listaSenhas");

  // Solicitar login
  print("\nÁREA DE LOGIN\nAcesse a sua conta.\n\nDigite seu nome de usuário e pressione ENTER: ");
  String? usuarioLogin = stdin.readLineSync();

  print("\nDigite sua senha e pressione ENTER: ");
  String? senhaLogin = stdin.readLineSync();

  // Verificar se usuário e senha estão corretos
  if (listaUsuarios.contains(usuarioLogin) && listaSenhas.contains(senhaLogin)) {
    print("\nOlá, $usuarioLogin, bem-vindo(a) novamente!");
    print("\nAh não! Verificamos que você esqueceu de atribuir as notas de 2 alunos. Vamos corrigir isso?");
    print("\n\nINSTRUÇÕES\nDigite as notas do aluno separadas em ESPAÇOS e utilize PONTO para separar casas decimais.");

    // Criar um Map para armazenar os nomes dos alunos e suas notas
    Map<String, List<double>> alunosNotas = {};

    // Lista com os nomes dos alunos
    List<String> alunos = ["João", "Maria"];

    // Capturar notas para cada aluno
    for (String aluno in alunos) {
      // Solicitar as notas do aluno
      print("\n\nDigite as 4 notas de $aluno separadas por espaço: ");
      String? inputNotas = stdin.readLineSync();

      if (inputNotas != null) {
        // Dividir o input em uma lista de strings, com cada elemento representando uma nota
        List<String> notasStrings = inputNotas.split(' ');
        
        // Converter a lista de strings para uma lista de doubles
        List<double> notas = notasStrings.map((nota) => double.parse(nota)).toList();

        // Associar as notas ao respectivo aluno no Map
        alunosNotas[aluno] = notas;
      }
    }

    // Confirmar o cadastro das notas
    print("\n\nMaravilha! Você cadastrou as notas no sistema.");
    print("\n\nRESUMO");

    // Exibir as notas e calcular a média de cada aluno
    alunosNotas.forEach((aluno, notas) {
      // Exibir as notas do aluno
      print("\nNotas\n$aluno: ${notas.join(', ')}");

      // Calcular a média das notas do aluno
      double media = notas.reduce((a, b) => a + b) / notas.length;

      // Exibir a média
      print("\nMédia\n$aluno: ${media.toStringAsFixed(2)}");
    });
    
  } else {
    // Caso o login esteja incorreto
    print("\nO seu usuário ou senha estão incorretos. Digite novamente.");
  }
}