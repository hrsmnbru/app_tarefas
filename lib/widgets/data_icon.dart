import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPrevistaIcon extends StatelessWidget {
  final DateTime dataPrevista;
  final Color? color;

  const DataPrevistaIcon({super.key, required this.dataPrevista, this.color});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    final corpadrao = color ?? Theme.of(context).colorScheme.tertiary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.calendar_today, size: 14, color: corpadrao),
        const SizedBox(width: 4),
        Text(DateFormat('dd.MM.yyyy').format(dataPrevista), style: TextStyle(color: corpadrao, fontSize: 12)),
      ],
    );
  }
}