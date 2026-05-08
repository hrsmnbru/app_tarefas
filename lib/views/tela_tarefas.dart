import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/util/rotas.dart';
import 'package:app_tarefas/widgets/filtro_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaTarefas extends StatelessWidget {
  final String titulo;

  const TelaTarefas({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TarefaProvider>(context);
    //var tarefas = provider.tarefas;

    return DefaultTabController(
      length: filtroTabbarLength,
      child: Scaffold(
        appBar: AppBar(
          title: Text(titulo, style: const TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.primary,

          bottom: FiltroTabbar(provider: provider),
        ),

        body: FiltroTabbarView(provider: provider),
        

        /*body: SlidableAutoCloseBehavior(
          child: tarefas.isEmpty
              ? const Center(child: Text('Nenhuma tarefa encontrada.'))
              : ListView.builder(
                  itemCount: provider.tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = provider.tarefas[index];
                    return TarefaCard(
                      tarefa: tarefa,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Rotas.telaDetalhes,
                        arguments: tarefa.id,
                      ),
                      onDelete: () => provider.removeTarefa(tarefa.id!),
                    );
                  },
                ),
        ),*/

        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Rotas.telaAdicionar),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
