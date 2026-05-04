import 'package:app_tarefas/models/categoria.dart';
import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/util/rotas.dart';
import 'package:app_tarefas/widgets/data_icon.dart';
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Center(
              child: Text(
                tarefa.titulo,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (tarefa.descricao.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(tarefa.descricao, textAlign: TextAlign.justify, style: TextStyle(fontSize: 14),),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                DataPrevistaIcon(dataPrevista: tarefa.dataPrevista),
                Row(
                  children: [
                    Icon(
                      tarefa.categoria.icone,
                      size: 14,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      tarefa.categoria.label,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                if (tarefa.importante)
                  Row(
                    children: [
                      Icon(
                        Icons.error_rounded,
                        size: 14,
                        color: Colors.orangeAccent[400],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Importante',
                        style: TextStyle(
                          color: Colors.orangeAccent[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Rotas.telaEditar, arguments: tarefa.id),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(
          Icons.edit,
          size: 30,
          color: Colors.white,
          ),
      ),
    );
  }
}
