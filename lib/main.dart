import 'package:app_tarefas/util/rotas.dart';
import 'package:app_tarefas/providers/tarefa_provider.dart';
import 'package:app_tarefas/views/tela_tarefas.dart';
import 'package:app_tarefas/views/tela_detalhes.dart';
import 'package:app_tarefas/views/tela_adicionar.dart';
import 'package:app_tarefas/views/tela_editar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TarefaProvider(),
      child: MaterialApp(
        //para deixar tudo em português
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2E5384),
            primary: const Color(0xFF2E5384),
            secondary: const Color(0xFF77A6D3),
            tertiary: const Color(0xFFC46060),
            error: const Color(0xFF823939),
            surface: const Color.fromARGB(255, 249, 249, 249),
            onSurface: Colors.black87,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onError: Colors.white,
          ),
        ),
        home: TelaTarefas(titulo: 'Lista de Tarefas'),
        routes: {
          Rotas.telaDetalhes: (context) =>
              const TelaDetalhes(titulo: "Detalhes da Tarefa"),
          Rotas.telaAdicionar: (context) =>
              const TelaAdicionar(titulo: 'Adicionar Tarefa'),
          Rotas.telaEditar: (context) =>
              const TelaEditar(titulo: 'Editar Tarefa'),
        },
      ),
    );
  }
}
