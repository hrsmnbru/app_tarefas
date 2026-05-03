import 'package:app_tarefas/models/tarefa.dart';
import 'package:flutter/material.dart';

class ImportanteIcon extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback? onToggle;

  const ImportanteIcon({super.key, required this.tarefa, this.onToggle});  

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 36,
      icon: Icon(
        tarefa.importante ? Icons.error_rounded : Icons.error_rounded,
        //color: tarefa.importante ? Colors.red : Colors.grey,
        color: Colors.red,
      ),
      onPressed: onToggle,
      );
  }
}