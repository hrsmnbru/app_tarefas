import 'package:flutter/material.dart';

class TelaAdicionar extends StatelessWidget {
  final String titulo;

  const TelaAdicionar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: const Center(
        child: Text('Conteúdo da Tela de Adicionar Tarefa'),
      ),
    );
  }
}
