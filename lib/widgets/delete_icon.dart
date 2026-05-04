import 'package:flutter/material.dart';

class DeleteIcon extends StatelessWidget {
  final VoidCallback? onDelete;

  const DeleteIcon({super.key, this.onDelete});

  void _confirmarDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir tarefa'),
        content: const Text('Tem certeza que deseja excluir esta tarefa?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          TextButton(
            child: const Text('Confirmar'),
            onPressed: () {
              Navigator.of(context).pop();
              if (onDelete != null) {
                onDelete!();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.remove),
      color: Theme.of(context).colorScheme.shadow,
      onPressed: onDelete != null ? () => _confirmarDelete(context) : null,
    );
  }
}
