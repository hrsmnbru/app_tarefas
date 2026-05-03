import 'package:app_tarefas/models/categoria.dart';
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
  final Categoria categoria;
  //final String predecessoraId;
  //final String sucessoraId;

  Tarefa({
    int? id,
    required this.titulo,
    required this.descricao,
    required this.dataPrevista,
    this.importante = false,
    this.realizada = false,
    this.categoria = Categoria.pessoal,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'dataPrevista': dataPrevista.toIso8601String(),
      'importante': importante ? 1 : 0,
      'realizada': realizada ? 1 : 0,
      'categoria': categoria.name,
    };
  }

  @override
  set id(int id) => _id = id;
  @override
  int? get id => _id;

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    var tarefa = Tarefa(
      id: map['id'] as int?,
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      dataPrevista: DateTime.parse(map['dataPrevista'] as String),
      importante: map['importante'] == 0 ? false : true,
      realizada: map['realizada'] == 0 ? false : true,
      categoria: Categoria.values.firstWhere(
        (cat) => cat.name == map['categoria'],
        orElse: () => Categoria.pessoal,
      ),
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
        'realizada: $realizada, '
        'categoria: $categoria}';
  }

  Tarefa copyWith({
    //criado para permitir atualização de tarefa
    int? id,
    String? titulo,
    String? descricao,
    DateTime? dataPrevista,
    bool? importante,
    bool? realizada,
    Categoria? categoria,
  }) {
    final t = Tarefa(
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      dataPrevista: dataPrevista ?? this.dataPrevista,
      importante: importante ?? this.importante,
      realizada: realizada ?? this.realizada,
      categoria: categoria ?? this.categoria,
    );
    final resolvedId = id ?? this.id;
    if (resolvedId != null) t.id = resolvedId;
    return t;
  }
}
