import 'package:flutter/material.dart';
import 'package:app_tarefas/models/tarefa.dart';  
import 'package:app_tarefas/util/tarefa_database.dart';

class TarefaProvider with ChangeNotifier{
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;
  
  Future<void> carregarTarefas() async {
    _tarefas = await TarefaDatabase.list("Tarefa")
      .then((res) =>
       _tarefas = res.map( (mapa) => Tarefa.fromMap(mapa)).toList());
    notifyListeners();
  }

  void addTarefa(Tarefa tarefa){
    TarefaDatabase.insert(tarefa);
    _tarefas.add(tarefa);
    notifyListeners();
  }

  void removeTarefa(int id){
    TarefaDatabase.delete("Tarefa", id);
    _tarefas.removeWhere((tarefa) => tarefa.id == id);
    notifyListeners();
  }
}