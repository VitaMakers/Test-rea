# Kiiru: tour pelas telas (etapa 1, só leitura)

Navegação automática feita em 14/10/2026 com a conta da agência, sem criar,
alterar ou apagar nada: toda chamada que gravaria dados foi bloqueada antes de
sair do navegador. Foram 27 rotas, com prints e a lista de abas, botões e campos
de cada uma. Nomes de clientes e valores reais ficaram de fora deste documento.

Complementa o [mapa funcional](mapa-funcional.md), que veio do código público.

## Início (`/`)

- Três atalhos grandes: **Nova tarefa**, **Novo projeto**, **Novos clientes**.
- Lista de tarefas em abas: **Atrasadas**, **Hoje**, **A vencer**, **Concluídas**,
  com contadores, filtro **Minhas / Equipe** e filtro por cliente.
- Cartões de resumo da semana: aprovações e ajustes solicitados pelo cliente.

## Dashboard (`/dashboard`)

Painel gerencial com blocos: Alertas, Tarefas atrasadas, Status dos projetos,
Atividade da equipe, Carga de trabalho, Publicações, Atividade recente, Horas
da equipe, Desempenho, Solicitações dos clientes, Financeiro do mês e Projetos
em andamento.

## Painel de produção (`/kanban`)

- Quadro com colunas padrão: **Ideia → Roteiros → Em produção → Em revisão →
  Aguardando aprovação → Aprovado → Agendado → Publicado**, cada uma com contador.
- Seletor de painel (há um "Painel da Organização" e podem existir outros),
  filtro **Minhas tarefas**, busca, configuração de **Colunas** e atalho para
  **Automações**.
- Cada card mostra título, tempo registrado e botão de adicionar por coluna.

## Clientes (`/brands`)

- Grade de cartões por cliente: logo, nome, segmento (etiqueta), cor da marca
  (faixa no topo e bolinhas da paleta) e três indicadores: tarefas no mês,
  projetos ativos e atrasadas.
- Busca, total de clientes, botão de novo cliente, arquivar e excluir no cartão.

## Calendário (`/calendar`)

- Visões **Publicações** e **Agenda**; escala **Hoje / Mês / Semana / Dia**.
- Filtros por painel, responsável e prazo; legenda colorida por etapa
  (as mesmas etapas do quadro); "+N mais" quando o dia lota; **Exportar PDF**.

## Tarefas (`/tasks`)

- Abas **Todas / Minhas tarefas**, busca, filtro por pessoa e ordenação por prazo.
- Lista agrupada ("Tarefas pendentes") com etapa, data e hora, tempo registrado e
  prioridade (ex.: Média).
- `/ideas-lab` redireciona para cá.

## Projetos (`/campaigns`)

Filtros por status, responsável e período; **Relatório**; **Novo projeto**.

## Enviar ao portal (`/enviar-portal`)

Fluxo "Mandar pra aprovação": escolher cliente, escolher o que enviar
(**Criativo** ou **Só o roteiro**), filtrar publicações por título, código e data,
e enviar em lote.

## Automações (`/automations`)

Três abas, por painel: **Painel de produção**, **Fluxo da equipe**,
**Contagem de horas**.

- **Painel de produção**: regras do tipo "quando X acontecer, mover o card para a
  etapa Y" (ou "não mover"), agrupadas em:
  - _Portal do cliente_: cliente abriu tarefa, conteúdo enviado ao portal,
    roteiro enviado, cliente aprovou, aprovou já agendado, pediu ajuste,
    pediu ajuste no roteiro, aprovou o roteiro, enviou material;
  - _Publicação_, _Equipe_, **Trava de publicação** (etapas liberadas para
    publicar) e **Etapa de conclusão**.
- **Fluxo da equipe**: dono de cada etapa, distribuição automática
  (**Equilíbrio** de carga, rodízio, **Substituir** ou **Acrescentar**
  responsável) e próxima etapa.
- **Contagem de horas**: **SLA por etapa** (com aviso que registra no histórico),
  quem pode contar tempo, etapa que encerra o tempo, **tempo estimado por tipo
  de conteúdo** (por rede e formato), **cronômetro esquecido** (encerrar depois
  de X horas) e regra para lançamentos sobrepostos.

## Analytics (`/analytics`)

Exige escolher um cliente. Abas **Redes sociais** e **Posts**, período
(ex.: últimos 30 dias) e **Exportar PDF**.

## Relatórios (`/reports`)

Cinco tipos: **Cliente**, **Interno**, **Por projeto**, **Rentabilidade**, **Horas**.

## Financeiro (`/financeiro`)

- Abas: **Visão geral**, **A receber**, **A pagar**, **Movimentações**,
  **Fluxo de caixa**, **DRE**.
- Botões **Cadastros** (contas, categorias, fornecedores etc.), **+ A receber**
  e **+ A pagar**.
- Navegação por mês e filtros por cliente, fornecedor e categoria.
- Visão geral com indicadores: receita recebida, despesas pagas (fixas e
  variáveis), lucro realizado e projetado com margem, total a receber e a
  pagar com próximo vencimento, **receita recorrente** mensal, **ticket médio**
  e **inadimplência** (percentual, valor vencido e quantidade em aberto).
- Gráficos: fluxo mensal (entradas e saídas dos últimos 6 meses), despesas por
  categoria (agrupadas em fixas e variáveis, com subcategorias) e
  **lucro por cliente**; alternância **fluxo de caixa × competência**.

## Mensagens (`/mensagens`)

Chat interno com abas **Todas**, **Não lidas**, **1-a-1** e **Grupos** e busca
por pessoa ou conversa.

## Notificações (`/notifications`)

Abas **No app** e **WhatsApp (clientes)**; marcar todas como lidas.

## Configurações (`/settings`, também `/team`)

Abas: **Meu perfil** (dados pessoais, CPF, endereço com CEP, troca de senha),
**Dados da empresa**, **Parâmetros**, **Equipe**, **Permissões**, **Auditoria**,
**Notificações** e **Conexões**.

## Outras telas

- **Lixeira** (`/lixeira`): busca por título, código, cliente ou pessoa;
  restaurar ou excluir de vez.
- **Central de ajuda** (`/ajuda`): artigos por tema (clientes, portal, painel,
  calendário, analytics, relatórios, projetos, publicações, integrações,
  horas, financeiro, configurações, IA).
- **Suporte** (`/support`): abrir chamado ou falar no WhatsApp.
- **Feedback** (`/feedback`): tipo, descrição e anexo.
- **Novidades** (`/updates`): vídeo e sugestões.
- **NoCode Folio** (`/nocode-folio`): portfólio público com perfil editável.

## Ainda não coberto nesta etapa

- Telas que não terminaram de carregar no robô: **Integrações** e
  **Indique e ganhe**.
- Abas internas que não usam o padrão de abas (por exemplo, Fluxo da equipe e
  Contagem de horas nas Automações) e as abas das Configurações além de "Meu perfil".
- Detalhe de um cliente, de uma tarefa (o modal), do menu **Cadastros** do
  financeiro e dos formulários de criação.
- Portal do cliente e link de aprovação, vistos pelo lado do cliente.

## Etapa 2: dentro das telas (só leitura)

### Financeiro

- **Cadastros** abre: **Categorias** (abas Entradas, Fixas e Variáveis, com
  categoria principal e subcategorias), **Contas** financeiras, **Fornecedores**,
  **Serviços** (catálogo de serviços da agência) e **Ajustar saldo inicial**.
- **Nova receita** (+ A receber): cliente, competência (mês de referência),
  valor, descrição, categoria, parcelamento (à vista ou parcelado), vencimento,
  status "já recebido", observações e anexo.
- **Nova despesa** (+ A pagar): os mesmos campos, mais fornecedor; cliente é opcional.
- **A receber**: tabela com data, descrição, categoria, cliente, status e valor;
  filtros por cliente e status (todos, recebido etc.) e busca.
- **Movimentações**: retirada, aporte e transferência entre contas, filtro por conta.
- **DRE**: valores ou % do faturamento, comparativo mensal, competência ou caixa,
  exportação; estrutura faturamento − despesas variáveis − despesas fixas.

### Painel de produção

- **Configurar colunas**: adicionar coluna, cor de cada coluna e, por coluna,
  as opções **Link de aprovação** e **Sumir do portal**.

### Automações

- Tempo estimado por formato: **Feed/Post**, **Reels/Shorts**, **Story**, **Carrossel**.

### Relatórios

- **Rentabilidade** por cliente: horas, receita, custo, margem, R$/hora e
  cobertura; opção de incluir arquivados.
- **Horas**: por projetos e tarefas, colaboradores, canal e formato, etapa, e
  **estimado × realizado**; exportação em PDF.

### Publicações (`/integrations`)

Duas visões: **Status dos envios** (filtros por tipo, cliente, canal, formato
e data; busca por código) e **Contas conectadas**.

### Detalhe do cliente (`/brands/:id`)

Abas: **Visão geral**, **Informações**, **Faturamento**, **Portal do cliente**,
**Pastas**, **Feed**, **Formulários**, **Equipe**, **Indicadores** e **Histórico**.
A visão geral traz linha do tempo, redes conectáveis (Instagram, TikTok,
Facebook, YouTube, LinkedIn, X e Threads), tarefas por etapa, grupos de WhatsApp,
portal do cliente (com login ou acesso por link), arquivos, **hashtags padrão** e
**palavras proibidas**.

### Nova tarefa (formulário)

Título, objetivo, canal (Instagram, TikTok, YouTube, LinkedIn, X, Facebook,
Threads, Blog, material gráfico ou tarefa interna), formato (Feed, Reels, Story,
Carrossel), mídia, referências, **briefing interno** (só equipe), **briefing do
cliente** (aparece no portal), legenda, roteiro, checklist, publicar em
(só salvar, publicar agora ou agendar), colab, etapa, painel, cliente, projeto,
responsáveis, autor, início, prazo, data de conclusão, tags, prioridade,
lembrete e recorrência.

### Configurações

- **Permissões**: funções do sistema (ex.: Administrador com acesso total,
  Gerência com 34 permissões) e criação de novas funções.
- **Parâmetros**: título das tarefas sempre em maiúsculas, inclusive as abertas
  pelo cliente no portal.

### Comportamentos observados

- O botão **Novo projeto** cria o projeto na hora, sem formulário (a gravação
  foi bloqueada pelo robô).
- A tela de contas conectadas sincroniza as contas sozinha ao abrir.
- Ao entrar na conta, a Kiiru encerra as outras sessões abertas do usuário.

## Etapa 3: testes de criação (em andamento)

Só na marca de teste **Nova Marca**, com cada gravação liberada passo a passo
e registrada.

### Tarefa criada

- Tarefa interna "TESTE CLAUDE 1" (código PUB-59250), etapa Ideia.
- Ao criar, o app fez três gravações: a tarefa, o destino de publicação dela e
  o cálculo/congelamento da estimativa de horas.
- Campos enviados na criação de uma tarefa: título, canal, formato, painel,
  cliente, coluna (etapa), responsável, autor, usuário, projeto, prioridade,
  visível ao cliente, exige aprovação para publicar, data de conclusão, hora
  prevista, início, status, data agendada, descrição, legenda, briefing interno,
  roteiro, briefing do cliente, flags de visibilidade no portal (roteiro,
  legenda, descrição, briefing, referências), links de referência, anexos
  internos, colaboradores, miniatura, arquivos, regra de recorrência e capa de Reels.
- A automação de **Fluxo da equipe** atribuiu um responsável sozinha logo após
  a criação.

### Modal da tarefa

Abas **Detalhes**, **Comentários**, **Tempo** e **Histórico**; briefing com
salvamento automático e gravação de instrução por voz; botões **Iniciar
relógio**, **Link de aprovação**, **Ajuste interno**, **Finalizar tarefa**,
**Salvar** e lixeira.
