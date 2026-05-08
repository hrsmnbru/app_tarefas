import 'package:app_tarefas/models/tarefa.dart';
import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/util/rotas.dart';
import 'package:app_tarefas/widgets/tarefa_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class _Filtro {
  final String label;
  final List<Tarefa> Function(TarefaProvider) getter;

  const _Filtro({required this.label, required this.getter});
}

List<Tarefa> _tarefas(TarefaProvider p) => p.tarefas;
List<Tarefa> _importantes(TarefaProvider p) => p.importantes;
List<Tarefa> _realizadas(TarefaProvider p) => p.realizadas;
List<Tarefa> _atrasadas(TarefaProvider p) => p.atrasadas;

final _filtros = [
  _Filtro(label: 'Todas', getter: _tarefas),
  _Filtro(label: 'Importantes', getter: _importantes),
  _Filtro(label: 'Realizadas', getter: _realizadas),
  _Filtro(label: 'Atrasadas', getter: _atrasadas),
];

class FiltroTabbar extends StatelessWidget implements PreferredSizeWidget {
  final TarefaProvider provider;

  const FiltroTabbar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.orangeAccent,
      isScrollable: true,
      tabs: _filtros.map((f) {
        final count = f.getter(provider).length;
        return Tab(
          child: Row(
            children: [
              Text(f.label),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}

class FiltroTabbarView extends StatelessWidget {
  final TarefaProvider provider;

  const FiltroTabbarView({super.key, required this.provider});

  Widget _buildLista(BuildContext context, List<Tarefa> tarefas) {
    if (tarefas.isEmpty) {
      return const Center(child: Text('Nenhuma tarefa encontrada.'));
    }
    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = tarefas[index];
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: _filtros
          .map((f) => _buildLista(context, f.getter(provider)))
          .toList(),
    );
  }
}

final filtroTabbarLength = _filtros.length;