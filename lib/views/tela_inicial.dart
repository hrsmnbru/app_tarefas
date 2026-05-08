import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/util/rotas.dart';
import 'package:app_tarefas/widgets/data_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TarefaProvider>(context);
    final colors = Theme.of(context).colorScheme;

    final tarefaspendentes = [...provider.tarefas]
      ..sort((a, b) => a.dataPrevista.compareTo(b.dataPrevista));

    final proxima = tarefaspendentes.isNotEmpty ? tarefaspendentes.first : null;

    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, Rotas.telaTarefas),
      child: Scaffold(
        backgroundColor: colors.primary,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Olá, atarefado',
                    style: TextStyle(
                      color: Colors.orangeAccent[200],
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 200),

                  if (proxima != null) ...[
                    Text(
                      'Próximo vencimento',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      proxima.titulo,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 0),
                    Center(
                      child: DataPrevistaIcon(
                        dataPrevista: proxima.dataPrevista,
                        color: Colors.orangeAccent[400],
                      ),
                    ),
                  ] else ...[
                    const Text(
                      'Nenhuma tarefa pendente',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),

                    const SizedBox(height: 64),

                    Text(
                      'Toque para continuar',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
