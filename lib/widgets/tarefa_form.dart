import 'package:app_tarefas/models/categoria.dart';
import 'package:app_tarefas/models/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TarefaForm extends StatefulWidget {
  final Tarefa? tarefaInicial;
  final void Function(Tarefa tarefa) onSalvar;

  const TarefaForm({super.key, this.tarefaInicial, required this.onSalvar});

  @override
  State<StatefulWidget> createState() {
    return _TarefaFormState();
  }
}

class _TarefaFormState extends State<TarefaForm> {
  final _formKey = GlobalKey<FormState>();

  late String _titulo = '';
  late String _descricao = '';
  late DateTime _dataPrevista = DateTime.now();
  bool _importante = false;
  late Categoria _categoria;

  @override
  void initState() {
    super.initState();

    _titulo = widget.tarefaInicial?.titulo ?? '';
    _descricao = widget.tarefaInicial?.descricao ?? '';
    _dataPrevista = widget.tarefaInicial?.dataPrevista ?? DateTime.now();
    _importante = widget.tarefaInicial?.importante ?? false;
    _categoria = widget.tarefaInicial?.categoria ?? Categoria.pessoal;
  }

  void _salvarForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    final tarefa = Tarefa(
      id: widget.tarefaInicial?.id,
      titulo: _titulo,
      descricao: _descricao,
      dataPrevista: _dataPrevista,
      importante: _importante,
      realizada: widget.tarefaInicial?.realizada ?? false,
      categoria: _categoria,
    );

    widget.onSalvar(tarefa);
  }

  //método para mostrar o DatePicker
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: _dataPrevista,
      firstDate: DateTime(2026, 1, 1),
      lastDate: DateTime(2100),
    );
    if (dataSelecionada != null && dataSelecionada != _dataPrevista) {
      setState(() {
        _dataPrevista = dataSelecionada;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                spacing: 14,
                children: [
                  TextFormField( //TITULO
                    initialValue: _titulo,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => setState(() => _titulo = value),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 2,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      labelText: 'Título',
                      hint: Text('Informe o título da tarefa'),

                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Text(
                            _titulo.trim().isEmpty
                                ? 'T'
                                : _titulo.trim()[0].toUpperCase(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Cadê o título da tarefa?';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _titulo = value!;
                    },
                  ),

                  TextFormField( //DESCRIÇÃO
                    initialValue: _descricao,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                      labelText: 'Descrição',
                      contentPadding: const EdgeInsets.all(20),
                      hint: Text('Descreva a tarefa'),
                    ),
                    maxLines: 4,
                    onSaved: (value) {
                      _descricao = value ?? '';
                    },
                  ),

                  ListTile( //DATAPREVISTA
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Data Prevista'),
                    subtitle: Text(
                      DateFormat('dd.MM.yyyy').format(_dataPrevista),
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selecionarData(context),
                  ),

                  SwitchListTile( //ALTERNAR IMPORTANTE
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Importante'),
                    value: _importante,
                    onChanged: (value) {
                      setState(() {
                        _importante = value;
                      });
                    },
                  ),

                  Wrap( //BOTÕES CATEGORIA
                    spacing: 8,
                    children: Categoria.values
                        .map(
                          (c) => ChoiceChip(
                            avatar: Icon(c.icone),
                            label: Text(c.label),
                            selected: _categoria == c,
                            onSelected: (_) => setState(() => _categoria = c),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox( //BOTÃO SALVAR
            width: 200,
            child: ElevatedButton(
              onPressed: _salvarForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}
