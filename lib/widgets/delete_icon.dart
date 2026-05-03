import 'package:flutter/material.dart';

class DeleteIcon extends StatelessWidget {
  final VoidCallback? onDelete;

  const DeleteIcon({super.key, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.remove),
      color: Theme.of(context).colorScheme.error,
      onPressed: onDelete,
    );
  }
}