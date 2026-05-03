import 'package:app_tarefas/models/categoria.dart';
import 'package:app_tarefas/models/tarefa.dart';
import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/widgets/data_icon.dart';
import 'package:app_tarefas/widgets/delete_icon.dart';
import 'package:app_tarefas/widgets/importante_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TarefaCard extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback onTap; //callback para receber função de clique de acordo com a tela
  final VoidCallback? onDelete; //callback opcional, apenas para tela de tarefas

  const TarefaCard({
    super.key,
    required this.tarefa,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Slidable(
      key: ValueKey(tarefa.id),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.1,
        children: [
          CustomSlidableAction(
            onPressed: (context) => Provider.of<TarefaProvider>(
              context,
              listen: false,
            ).toggleImportante(tarefa),
            backgroundColor: Colors.transparent,

            child: ImportanteIcon(tarefa: tarefa),
          ),
        ],
      ),

      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Row(
          children: [
            if (tarefa.importante)
              Container(width: 12, height: 72, color: Theme.of(context).colorScheme.onPrimary)
            else
              Container(width: 12, height: 72, color: Colors.transparent),
            Expanded(
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      tarefa.titulo,
                      style: TextStyle(color: Colors.blueGrey[950], fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Icon(tarefa.categoria.icone, size: 16, color: Colors.blueGrey[400]),
                    const SizedBox(width: 6),
                    DataPrevistaIcon(dataPrevista: tarefa.dataPrevista),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [DeleteIcon(onDelete: onDelete)],
                ),
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
