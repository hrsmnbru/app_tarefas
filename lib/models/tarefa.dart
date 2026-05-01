import 'package:app_tarefas/models/model.dart';

class Tarefa implements Model {
  int? _id;
  final String titulo;
  final String descricao;
  final DateTime dataPrevista;
  final bool importante;
  final bool realizada;

  //possiveis atributos
  //final DateTime? dataRealizada;
  //final List<Subtarefa> subtarefas;
  //final String? categoria;
  //final String predecessoraId;
  //final String sucessoraId;

  Tarefa({
    required this.titulo,
    required this.descricao,
    required this.dataPrevista,
    this.importante = false,
    this.realizada = false,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'dataPrevista': dataPrevista.toIso8601String(),
      'importante': importante ? 1 : 0,
      'realizada': realizada ? 1 : 0,
    };
  }

  @override
  set id(int id) => _id = id;
  @override
  int? get id => _id;

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    var tarefa = Tarefa(
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      dataPrevista: DateTime.parse(map['dataPrevista'] as String),
      importante: map['importante'] == 0 ? false : true,
      realizada: map['realizada'] == 0 ? false : true,
    );
    tarefa.id = map['id'] as int;
    return tarefa;
  }

  @override
  String toString() {
    return 'Tarefa{'
        'id: $id,'
        'titulo: $titulo, '
        'descricao: $descricao, '
        'dataPrevista: $dataPrevista, '
        'importante: $importante, '
        'realizada: $realizada}';
  }
}
