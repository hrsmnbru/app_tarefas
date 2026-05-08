import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/util/rotas.dart';
import 'package:app_tarefas/widgets/data_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animar;
  bool _riscando = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _animar = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> tap() async {
    if (_riscando) return;

    setState(() {
      _riscando = true;
    });

    await _controller.forward();

    if (mounted) {
      Navigator.pushReplacementNamed(context, Rotas.telaTarefas);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TarefaProvider>(context);
    final colors = Theme.of(context).colorScheme;

    final tarefaspendentes = [...provider.tarefas]
      ..sort((a, b) => a.dataPrevista.compareTo(b.dataPrevista));

    final proxima = tarefaspendentes.isNotEmpty ? tarefaspendentes.first : null;

    return GestureDetector(
      onTap: tap,
      child: Scaffold(
        backgroundColor: colors.primary,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IntrinsicWidth(
                  //   child: Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       Text(
                  //         'RISQUÉ',
                  //         style: TextStyle(
                  //           color: Colors.orangeAccent[200],
                  //           fontSize: 48,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       AnimatedBuilder(
                  //         animation: _animar,
                  //         builder: (context, _) {
                  //           return Align(
                  //             alignment: Alignment.centerLeft,
                  //             child: FractionallySizedBox(
                  //               widthFactor: _animar.value,
                  //               alignment: Alignment.centerLeft,
                  //               child: Container(
                  //                 height: 3,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.orangeAccent[200],
                  //                   borderRadius: BorderRadius.circular(2),
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  AnimatedBuilder(
                    animation: _animar,
                    builder: (context, child) {
                      return CustomPaint(
                        foregroundPainter: _RiscoPainter(
                          _animar.value,
                          Colors.orangeAccent[200]!,
                        ),
                        child: child,
                      );
                    },
                    child: Text(
                      'RISQUÉ',
                      style: TextStyle(
                        color: Colors.orangeAccent[200],
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                      ),
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

class _RiscoPainter extends CustomPainter {
  final double progress;
  final Color color;

  _RiscoPainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final y = size.height / 2;
    canvas.drawLine(Offset(0, y), Offset(size.width * progress, y), paint);
  }

  @override
  bool shouldRepaint(_RiscoPainter old) => old.progress != progress;
}
