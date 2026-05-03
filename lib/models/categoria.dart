import 'package:flutter/material.dart';

enum Categoria {
  pessoal,
  trabalho,
  estudo,
  saude,
}

extension CategoriaExtension on Categoria{
  IconData get icone{
    switch(this){
      case Categoria.pessoal: return Icons.home;
      case Categoria.trabalho: return Icons.work;
      case Categoria.estudo: return Icons.school;
      case Categoria.saude: return Icons.medical_information_rounded;
    }
  }

  String get label{
    switch(this){
      case Categoria.pessoal: return 'Pessoal';
      case Categoria.trabalho: return 'Trabalho';
      case Categoria.estudo: return 'Estudo';
      case Categoria.saude: return 'Saúde';
    }
  }
}