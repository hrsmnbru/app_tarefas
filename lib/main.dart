import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TarefaProvider(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 77, 107)),
        ),
        home: TelaTarefas(titulo: 'Lista de Tarefas'),
        routes: {
          Rotas.telaDetalhes: (context) => const TelaDetalhes(titulo: "Detalhes da Tarefa"),
          Rotas.telaAdicionar: (context) => const TelaAdicionar(titulo: 'Adicionar Tarefa'),
          Rotas.telaEditar: (context) => const TelaEditar(titulo: 'Editar Tarefa'),
        },
    );
  }
}
