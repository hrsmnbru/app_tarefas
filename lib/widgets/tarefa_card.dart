import 'package:app_tarefas/models/tarefa.dart';
import 'package:flutter/material.dart';

class TarefaCard extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback onTap; //callback para receber função de clique de acordo com a tela
  final VoidCallback? onDelete; //callback opcional, apenas para tela de tarefas

  const TarefaCard({super.key, required this.tarefa, required this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card( //card versão 1 só pra enxergar as coisas acontecendo ---------DEIXAR ISSO BONITO
      child: ListTile(
        title: Text(tarefa.titulo, style: TextStyle(color: tarefa.realizada ? Colors.grey : colors.onSurface)),
        subtitle: Text('Data prevista: ${tarefa.dataPrevista.toLocal().toString().split(' ')[0]}', style: TextStyle(color: tarefa.realizada ? Colors.grey : colors.onSurface)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tarefa.importante)
              const Icon(Icons.star, color: Colors.amber),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}