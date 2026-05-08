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

    return DefaultTabController(
      length: filtroTabbarLength,
      child: Scaffold(
        appBar: AppBar(
          title: Text(titulo, style: const TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.primary,

          bottom: FiltroTabbar(provider: provider),
        ),

        body: FiltroTabbarView(provider: provider),

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
