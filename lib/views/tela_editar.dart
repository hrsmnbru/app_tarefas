import 'package:flutter/material.dart';

class TelaEditar extends StatelessWidget {
  final String titulo;

  const TelaEditar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: const Center(
        child: Text('Conteúdo da Tela de Editar Tarefa'),
      ),
    );
  }
}
