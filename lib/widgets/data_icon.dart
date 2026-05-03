import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPrevistaIcon extends StatelessWidget {
  final DateTime dataPrevista;

  const DataPrevistaIcon({super.key, required this.dataPrevista});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today, size: 14, color: Colors.blueGrey[400]),
        const SizedBox(width: 4),
        Text(DateFormat('dd.MM.yyyy').format(dataPrevista), style: TextStyle(color: Colors.blueGrey[500], fontSize: 12)),
      ],
    );
  }
}