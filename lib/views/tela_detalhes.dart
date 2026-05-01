import 'package:flutter/material.dart';

class TelaDetalhes extends StatelessWidget {
  final String titulo;

  const TelaDetalhes({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: const Center(child: Text('Detalhes da Tarefa')),
    );
  }
}
