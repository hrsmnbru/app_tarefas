import 'package:app_tarefas/models/tarefa.dart';
import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/widgets/tarefa_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaEditar extends StatelessWidget {
  final String titulo;

  const TelaEditar({super.key, required this.titulo});

  void _editarTarefa(BuildContext context, Tarefa tarefa){
    Provider.of<TarefaProvider>(context, listen: false).editTarefa(tarefa);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo, style: const TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TarefaForm(onSalvar: (tarefa) => _editarTarefa(context, tarefa)),
      ),
    );
  }
}
