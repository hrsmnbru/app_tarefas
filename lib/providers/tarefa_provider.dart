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

  Future<void> addTarefa(Tarefa tarefa) async{ //ajuste com async e await para garantir que a tarefa seja inserida no banco de dados antes de ser adicionada à lista e notificar os listeners
    await TarefaDatabase.insert(tarefa);
    _tarefas.add(tarefa);
    notifyListeners();
  }

  Future<void> removeTarefa(int id) async{ //mesma lógica do addTarefa, garantindo que a tarefa seja removida do banco de dados antes de ser removida da lista e notificar os listeners
    await TarefaDatabase.delete("Tarefa", id);
    _tarefas.removeWhere((tarefa) => tarefa.id == id);
    notifyListeners();
  }
}