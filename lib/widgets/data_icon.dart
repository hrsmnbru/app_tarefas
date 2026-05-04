import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPrevistaIcon extends StatelessWidget {
  final DateTime dataPrevista;

  const DataPrevistaIcon({super.key, required this.dataPrevista});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(Icons.calendar_today, size: 14, color: colors.tertiary),
        const SizedBox(width: 4),
        Text(DateFormat('dd.MM.yyyy').format(dataPrevista), style: TextStyle(color: colors.tertiary, fontSize: 12)),
      ],
    );
  }
}