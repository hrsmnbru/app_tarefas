import 'package:app_tarefas/models/categoria.dart';
import 'package:app_tarefas/models/tarefa.dart';

final tarefasMock = [
  Tarefa(
    titulo: 'Comprar mantimentos',
    descricao:
        'Fazer compras completas no mercado: leite integral, ovos caipira, pão de forma e francês, frutas da estação, café em grão e filtrado, além de repor itens de limpeza que estão acabando.',
    dataPrevista: DateTime.now().add(const Duration(days: 2)),
    categoria: Categoria.pessoal,
  ),
  Tarefa(
    titulo: 'Revisar TCC',
    descricao:
        'Revisar o capítulo de Trabalhos Correlatos, ajustar todas as citações no formato ABNT, verificar se as referências estão corretas e garantir que a comparação entre os aplicativos similares esteja bem fundamentada.',
    dataPrevista: DateTime.now().add(const Duration(days: 5)),
    categoria: Categoria.estudo,
  ),
  Tarefa(
    titulo: 'Reunião com cliente',
    descricao:
        'Apresentar o progresso atual da landing page da Bom Tempo Impermeabilização, mostrar o protótipo navegável no Figma, alinhar ajustes de cor e tipografia solicitados, e definir prazo para entrega da versão final.',
    dataPrevista: DateTime.now().add(const Duration(days: 3)),
    categoria: Categoria.trabalho,
  ),
  Tarefa(
    titulo: 'Entregar relatório mensal',
    descricao:
        'Consolidar todas as métricas de desempenho do mês, organizar os dados em tabelas comparativas, redigir a análise dos resultados e enviar o documento formatado para o supervisor até as 18h.',
    dataPrevista: DateTime.now().add(const Duration(days: 1)),
    importante: true,
    categoria: Categoria.trabalho,
  ),
  Tarefa(
    titulo: 'Consulta médica',
    descricao:
        'Check-up anual de rotina. Lembrar de levar todos os exames anteriores, lista de medicamentos em uso e anotar as dúvidas sobre os resultados do último hemograma para perguntar ao médico.',
    dataPrevista: DateTime.now().add(const Duration(days: 7)),
    importante: true,
    categoria: Categoria.pessoal,
  ),
  Tarefa(
    titulo: 'Configurar ambiente Flutter',
    descricao:
        'Reinstalar o Flutter SDK do zero, reconfigurar o ADB e as variáveis de ambiente no Windows, testar o emulador Pixel 8 com API 37 e validar hot reload no VS Code e Android Studio.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 3)),
    realizada: true,
    categoria: Categoria.estudo,
  ),
  Tarefa(
    titulo: 'Criar wireframe da landing page',
    descricao:
        'Desenvolver o esboço completo de todas as seções da landing page: hero com chamada principal, seção de serviços com ícones, galeria de antes e depois, depoimentos de clientes e formulário de contato com mapa.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 1)),
    realizada: true,
    importante: true,
    categoria: Categoria.trabalho,
  ),
  Tarefa(
    titulo: 'Pagar conta de internet',
    descricao:
        'O vencimento já passou há quatro dias. Acessar o aplicativo da operadora, verificar o valor atualizado com multa e juros, gerar o boleto corrigido e efetuar o pagamento para evitar suspensão do serviço.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 4)),
    categoria: Categoria.pessoal,
  ),
  Tarefa(
    titulo: 'Enviar proposta para cliente',
    descricao:
        'Elaborar e enviar proposta de contrato de manutenção mensal do site após a entrega, incluindo escopo de serviços, SLA de atualização de conteúdo, valor mensal e condições de reajuste anual.',
    dataPrevista: DateTime.now().subtract(const Duration(days: 2)),
    importante: true,
    categoria: Categoria.trabalho,
  ),
];
