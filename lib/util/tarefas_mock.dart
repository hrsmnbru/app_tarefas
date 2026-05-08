import 'package:app_tarefas/models/categoria.dart';
import 'package:app_tarefas/models/tarefa.dart';

final tarefasMock = [
  Tarefa(
    titulo: 'Comprar mantimentos',
    descricao: 'Leite, ovos, pão, frutas e café.',
    dataPrevista: DateTime.now().add(const Duration(days: 2)),
    categoria: Categoria.pessoal,
  ),
  Tarefa(
    titulo: 'Revisar TCC',
    descricao: 'Revisar o capítulo de Trabalhos Correlatos e ajustar citações ABNT.',
    dataPrevista: DateTime.now().add(const Duration(days: 5)),
    categoria: Categoria.estudo,
  ),
  Tarefa(
    titulo: 'Reunião com cliente',
    descricao: 'Apresentar progresso da landing page da Bom Tempo.',
    dataPrevista: DateTime.now().add(const Duration(days: 3)),
    categoria: Categoria.trabalho,
  ),

  Tarefa(
    titulo: 'Entregar relatório mensal',
    descricao: 'Consolidar métricas e enviar para o supervisor.',
    dataPrevista: DateTime.now().add(const Duration(days: 1)),
    importante: true,
    categoria: Categoria.trabalho,
  ),
  Tarefa(
    titulo: 'Consulta médica',
    descricao: 'Check-up anual — lembrar de levar exames anteriores.',
    dataPrevista: DateTime.now().add(const Duration(days: 7)),
    importante: true,
    categoria: Categoria.pessoal,
  ),

  Tarefa(
    titulo: 'Configurar ambiente Flutter',
    descricao: 'Reinstalar SDK, ADB e testar emulador Pixel 8.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 3)),
    realizada: true,
    categoria: Categoria.estudo,
  ),
  Tarefa(
    titulo: 'Criar wireframe da landing page',
    descricao: 'Esboço das seções: hero, serviços, depoimentos e contato.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 1)),
    realizada: true,
    importante: true,
    categoria: Categoria.trabalho,
  ),

  Tarefa(
    titulo: 'Pagar conta de internet',
    descricao: 'Vencimento já passou — verificar multa.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 4)),
    categoria: Categoria.pessoal,
  ),

  Tarefa(
    titulo: 'Enviar proposta para cliente',
    descricao: 'Proposta de manutenção mensal do site após entrega.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 2)),
    importante: true,
    categoria: Categoria.trabalho,
  ),
];