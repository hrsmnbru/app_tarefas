import 'package:app_tarefas/util/tarefas_mock.dart';
import 'package:flutter/material.dart';
import 'package:app_tarefas/models/tarefa.dart';  
import 'package:app_tarefas/util/tarefa_database.dart';

class TarefaProvider with ChangeNotifier{
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas.where((t) => !t.realizada).toList();
  
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

  Future<void> editTarefa(Tarefa tarefa) async{
    print('editando');
    await TarefaDatabase.update(tarefa);
    int index = _tarefas.indexWhere((t) => t.id == tarefa.id);
    if (index != -1) {
      _tarefas[index] = tarefa;
      notifyListeners();
    }
  }

  Future<void> removeTarefa(int id) async{ //mesma lógica do addTarefa, garantindo que a tarefa seja removida do banco de dados antes de ser removida da lista e notificar os listeners
    await TarefaDatabase.delete("Tarefa", id);
    _tarefas.removeWhere((tarefa) => tarefa.id == id);
    notifyListeners();
  }

  Tarefa buscarPorId(int id) {
    return _tarefas.firstWhere((tarefa) => tarefa.id == id);
  }

  Future<void> toggleImportante(Tarefa tarefa) async{ //para alternar status importante
    final tarefaAtualizada = tarefa.copyWith(importante: !tarefa.importante);
    await editTarefa(tarefaAtualizada);
  }

  List<Tarefa> get importantes => _tarefas.where((t) => t.importante && !t.realizada).toList();

  List<Tarefa> get realizadas => _tarefas.where((t) => t.realizada).toList();

  List<Tarefa> get atrasadas => _tarefas.where((t) => t.atrasada).toList();

  Future<void> init() async{
    await carregarTarefas();

    if(_tarefas.isEmpty) await _carregarMock();
    notifyListeners();
  }

  Future<void> _carregarMock() async{
    for(final tarefa in tarefasMock){
      await addTarefa(tarefa);
    }
  }

  Future<void> toggleRealizada(Tarefa tarefa) async{
    final TarefaRealizada = tarefa.copyWith(realizada: !tarefa.realizada);
    await editTarefa(TarefaRealizada);
    notifyListeners();
  }
}