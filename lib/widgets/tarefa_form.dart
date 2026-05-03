import 'package:app_tarefas/models/tarefa.dart';
import 'package:flutter/material.dart';

class TarefaForm extends StatefulWidget{
  final Tarefa? tarefaInicial;
  final void Function(Tarefa tarefa) onSalvar;

  const TarefaForm({super.key, this.tarefaInicial, required this.onSalvar});
  
  @override
  State<StatefulWidget> createState() {
    return _TarefaFormState();
  }
}

class _TarefaFormState extends State<TarefaForm>{
  final _formKey = GlobalKey<FormState>();

  late String _titulo = '';
  late String _descricao = '';
  late DateTime _dataPrevista = DateTime.now();
  bool _importante = false;

  @override
  void initState(){
    super.initState();

    _titulo = widget.tarefaInicial?.titulo ?? '';
    _descricao = widget.tarefaInicial?.descricao ?? '';
    _dataPrevista = widget.tarefaInicial?.dataPrevista ?? DateTime.now();
    _importante = widget.tarefaInicial?.importante ?? false;
  }

  void _salvarForm(){
    if(!_formKey.currentState!.validate()){
      return;
    }

    _formKey.currentState!.save();

    final tarefa = Tarefa(
      id: widget.tarefaInicial?.id,
      titulo: _titulo,
      descricao: _descricao,
      dataPrevista: _dataPrevista,
      importante: _importante,
      realizada: widget.tarefaInicial?.realizada ?? false
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
  Widget build(BuildContext context){
    final colors = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _titulo,
            decoration: const InputDecoration(
              labelText: 'Título',
              border: OutlineInputBorder(), 
            ),
            validator: (value){ 
            if(value == null || value.trim().isEmpty){
              return 'Informe o título da tarefa';
            } return null;
            },
            onSaved: (value){
              _titulo = value!;
            },
            ),

            TextFormField(
              initialValue: _descricao,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(), 
              ),
              maxLines: 3,
              onSaved: (value){
                _descricao = value ?? '';
              },
            ),

            /*TextFormField(
              //initialValue: _dataPrevista.toIso8601String().substring(0,10), //SUBSTITUIÇÃO POR API SHOWDATEPICKER
              groupId: ListTile(
                title: const Text('Data Prevista'),
                subtitle: Text('${_dataPrevista.day}/${_dataPrevista.month}/${_dataPrevista.year}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selecionarData(context),
              ),
              decoration: const InputDecoration(
                labelText: 'Data Prevista',
                border: OutlineInputBorder(), 
              ),
              onSaved: (value){
                _dataPrevista = DateTime.parse(value!);
              },
            ),*/

            ListTile(
              title: const Text('Data Prevista'),
              subtitle: Text('${_dataPrevista.day}/${_dataPrevista.month}/${_dataPrevista.year}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selecionarData(context),
            ),

            SwitchListTile(
              title: const Text('Importante'),
              value: _importante, 
              onChanged: (value){
                setState(() {
                  _importante = value;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _salvarForm, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                ),
                child: const Text('Salvar'),
              ),  
            )
        ],
      ),
    );
  }
}