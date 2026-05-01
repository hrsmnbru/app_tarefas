import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/util/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaTarefas extends StatelessWidget {
  final String titulo;

  const TelaTarefas({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TarefaProvider>(context);
    provider.carregarTarefas();

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo, style: const TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: provider.tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = provider.tarefas[index];
          return Card(
            elevation: 3,
            color: Colors.lightBlue[200],
            child: ListTile(
              title: Text(
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                tarefa.titulo,
              ),
              leading: Text(style: const TextStyle(fontSize: 20), "id: ${tarefa.id}"),
              trailing: IconButton(
                onPressed: () => provider.removeTarefa(tarefa.id!), 
                icon: Icon(Icons.delete, color: Colors.red[400],)
              ),
              subtitle: Text(tarefa.descricao),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Rotas.telaDetalhes,
                  arguments: tarefa,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, Rotas.telaAdicionar);
        },
        tooltip: 'adicionar tarefa',
        child: const Icon(Icons.add_box_rounded),
      )
    );
  }
}