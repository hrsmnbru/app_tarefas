import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPrevistaIcon extends StatelessWidget {
  final DateTime dataPrevista;

  const DataPrevistaIcon({super.key, required this.dataPrevista});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today, size: 12, color: const Color.fromARGB(255, 158, 158, 158)),
        const SizedBox(width: 4),
        Text(DateFormat('dd.MM.yyyy').format(dataPrevista), style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}