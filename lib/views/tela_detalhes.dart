import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/widgets/importante_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaDetalhes extends StatelessWidget {
  final String titulo;

  const TelaDetalhes({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as int;
    final tarefa = Provider.of<TarefaProvider>(context).buscarPorId(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo, style: const TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tarefa.titulo),
            Text(tarefa.descricao),
            Text('Data prevista: ${tarefa.dataPrevista}'),
            ImportanteIcon(
              tarefa: tarefa,
              onToggle: () => Provider.of<TarefaProvider>(context, listen: false).toggleImportante(tarefa),
            ),
          ],
        ),
      ),
    );
  }
}
