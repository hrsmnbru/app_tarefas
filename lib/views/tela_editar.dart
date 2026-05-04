import 'package:app_tarefas/models/tarefa.dart';
import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/widgets/tarefa_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaEditar extends StatelessWidget {
  final String titulo;

  const TelaEditar({super.key, required this.titulo});

  void _editarTarefa(BuildContext context, Tarefa tarefa) async {
    await Provider.of<TarefaProvider>(context, listen: false).editTarefa(tarefa);
    Navigator.pop(context);
  }

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
        child: TarefaForm(
          tarefaInicial: tarefa,
          onSalvar: (tarefa) => _editarTarefa(context, tarefa),
        ),
      ),
    );
  }
}
