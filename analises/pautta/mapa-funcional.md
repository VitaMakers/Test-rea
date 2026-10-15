# Pautta: mapa funcional (análise com REA)

Análise estática da parte pública de https://workspace.pautta.app e do site
https://pautta.app, feita em 15/10/2026 com `rea analyze-javascript-application`
(REA 6.5.0) sobre os 228 arquivos que o painel entrega ao navegador (227
arquivos JavaScript lidos sem falhas), mais uma busca de rotas, chamadas ao
servidor e textos de tela.

Descreve **o que** o sistema faz, com palavras nossas. Nenhum código, imagem
ou marca da Pautta foi copiado para este repositório.

**Limites:** sem login e sem execução. Regras do servidor e telas com dados
reais não aparecem; rotas e chamadas encontradas no código não provam que
estão em uso.

## Tecnologia observada

- Site de vendas em WordPress; o painel é um app React servido pela Amazon (S3).
- **Servidor próprio** (`api.pautta.app`), com cerca de 357 rotas de API,
  organizadas por espaço de trabalho (_workspace_), e comunicação em tempo real
  (socket.io) para chat e atualizações.
- Arquivos enviados direto para armazenamento em nuvem com link assinado.
- Integrações: Google Agenda (reuniões), Meta (agendamento de publicações),
  Asaas (citado nos processos de onboarding), notificações push no navegador,
  webhooks, chaves de API e agentes de IA.
- **White label**: a agência aplica a própria identidade visual ao sistema e ao
  aplicativo dos clientes.

## Conceitos centrais (diferentes da Kiiru)

- **Packs e posts**: a produção é organizada em _packs_ (um pacote de conteúdos
  de um cliente num período) que contêm _posts_. O status do pack pode descer em
  cascata para os posts.
- **Ciclos**: períodos de trabalho com nome, início e fim (ex.: "Outubro"); os
  packs e as metas são ligados a um ciclo.
- **Gaveta**: posts guardados para usar depois, de todos os clientes, que podem
  ser enviados a um pack.
- **Captação**: itens de captação (gravação) dentro do pack, puxados para a criação.
- **Ajustes com marcação de tempo** em vídeo (o cliente aponta o segundo exato).

## Módulos

### 1. Início, Geral e Atalhos

Tela inicial com menções, quadro "Geral" com colunas configuráveis e botões
flutuantes opcionais (nova tarefa, lembrete, chat, suporte e feedback).

### 2. Criação (o coração do produto)

Kanban de produção por packs ou por posts, colunas e seções de colunas
configuráveis, **modo "Eu"** (só o que é meu), calendário editorial, gaveta,
ideias por cliente e detalhe do post (responsáveis, anexos com reordenação de
mídia, comentários, histórico de atividade, ajustes). Configurações do quadro:
atribuir automaticamente quem criou o pack, desatribuir ao concluir, exigir
responsável ao trocar status e cascata de status do pack para os posts.

### 3. Pauta, tarefas e fluxos de pauta

Tarefas com responsáveis, recorrência, conclusão e contador de realocações;
catálogo de tipos de tarefa. **Fluxos de pauta**: modelos que disparam uma
cascata de tarefas encadeadas entre colaboradores (por exemplo, "Produção de
Reels"), com prazos em dias úteis ou corridos e responsável fixo, herdado do
passo anterior ou o dono da pauta.

### 4. Ciclos e OnTrack (gamificação de produtividade)

- **Ciclos**: criar, ativar, ocultar e restaurar períodos.
- **OnTrack**: metas de pontos por colaborador e ciclo, aprovação de
  conclusões pelo gestor com comprovante, regras de realocação de tarefas,
  limites, flags por ciclo e painel próprio (também em modo TV).
- **Emblemas**: de performance (campeão, recorde) e de legado (aniversário de
  casa, cargo), atribuição individual ou em massa, aviso de emblema novo.
- **Hall da Fama**: ranking de quem mais conquistou emblemas, com apresentação
  em slides.
- **Ranks de clientes**.

### 5. Clientes

Cadastro, favoritos, colaboradores do cliente, links personalizados, impacto
antes de excluir e **reuniões**: agenda integrada ao Google, convidados, páginas
e seções de ata com **assinaturas**.

### 6. Onboarding de clientes

Pipelines em listas e cards para os primeiros dias de cada cliente, com
checklist de processos (ex.: criar grupo de WhatsApp, pasta no Drive, reunião de
kick-off, cadastro e cobrança no Asaas), comentários, histórico, tarefas e
lixeira.

### 7. Acompanhamento (controle de qualidade)

Conferência diária das publicações já postadas: marcar como conferido, sinalizar
erro (legenda errada, data errada, baixa qualidade), copiar legenda e ver dias
com conferência pendente; indicadores do dia e do mês.

### 8. Portal do cliente e aprovação

Portal por cliente com **link público e PIN**, entrega de conteúdos e de
roteiros separados, configuração das colunas para onde o post vai quando o
cliente aprova, reprova ou pede ajuste, e **responsáveis por ajustes**
(por exemplo, quem cuida de edição de vídeo). Roteiro com link público.

### 9. Financeiro

- **Lançamentos** com competência (move a DRE) e data de pagamento (move o
  fluxo de caixa), confirmação de pagamento.
- **Contratos** por cliente (mensalidade, duração, dia de vencimento, cláusula
  de rescisão, contrato assinado) e **despesas fixas**, que geram lançamentos
  previstos todo mês.
- **Recorrência**: MRR novo, expansão, contração e perdido, churn do mês e
  médio, LTV e ciclo de vida dos contratos.
- **Folha**: salário, VR, VT e bônus de OnTrack por colaborador e mês.
- **DRE**, **fluxo de caixa** e configurações.

### 10. Colaboradores, permissões e equipe

Perfil, preferências, modelos de permissão, permissões individuais, acesso,
**desligamento** com redistribuição das tarefas pendentes e funções do portal.

### 11. Comunicação

Chat interno em tempo real com membros, anexos, reações, mensagem fixada,
confirmação de leitura e lixeira; lembretes com adiar, repetir e encerrar;
notificações e push; avisos da plataforma com mídia.

### 12. Academy

Central de educação e processos da agência: seções e páginas, páginas com senha
e lixeira.

### 13. Modo TV

Painéis para exibir em uma TV no escritório (dashboard, OnTrack), com acesso
próprio e zoom.

### 14. Dashboard

Indicadores de clientes, colaboradores, produtividade, setores e tarefas.

### 15. Automações e IA

Regras de automação, **agentes de IA** com avatar que participam do chat via
API pública, buscador de pautas com IA, chaves de API e webhooks.

### 16. Administração da plataforma

Painel do dono do SaaS: workspaces, planos, recursos liberados por workspace,
usuários, avisos, chamados de suporte e webhooks.

## Aprofundamento (segunda leitura do código, todos os módulos)

Sem conta na Pautta, nada disto foi visto funcionando; é o que o código das
telas indica.

### Pauta (tarefas do dia a dia)

- Agenda de tarefas por colaborador e cliente, com recorrência (a cada N dias,
  em dias úteis ou corridos), duplicação para vários colaboradores, cor de
  destaque, troca de responsável e mover em lote.
- **Tarefas sugeridas e conclusão com aprovação**: o gestor aprova a tarefa ou
  a conclusão; o colaborador anexa um **comprovante** (link) e informa quantas
  entregas fez, o que alimenta os pontos do OnTrack.
- **Catálogo de tarefas por setor**, cada tipo com sua **pontuação**; uma tag
  liga a tarefa ao quadro "Geral".
- "Demanda extra" marca trabalho fora do escopo combinado.

### Criação (detalhe do pack e do post)

- Pack com posts, calendário próprio, prévia do feed e capa do feed ajustável.
- Post: carrossel, capa de vídeo, marcação de pessoas, cards de briefing,
  arquivos de até 500 MB, backup de fotos e vídeos, arquivo pronto para
  impressão, baixar mídia e PDF.
- Agendamento e remoção de agendamento direto no Instagram e no Facebook.
- **Ajuste com marcação**: no vídeo, o cliente aponta o minuto e segundo; na
  imagem, clica no ponto exato e escreve o que mudar.
- Ideias por cliente com imagens e links de referência, tipo e tags, com
  salvamento automático.

### Portal do cliente (lado do cliente)

- Entrada por link, com **PIN de 4 dígitos** e/ou **lista de e-mails
  autorizados**, e proteção contra excesso de tentativas.
- Entregas organizadas em "entregas" (packs publicados), modo de visualização
  como Instagram, aprovação, pedido de ajuste e chat com a agência.
- A agência vê quem acessou o portal, quem ainda não abriu e quem aprovou cada post.
- O portal também conecta redes do cliente (Instagram, TikTok, LinkedIn) para
  publicação, com opções como música automática em posts de foto.

### Roteiro público

Link de roteiro editável pelo cliente: cenas a gravar, narração, briefing de
fotos, briefing geral da captação, entregáveis previstos, observações de edição
e de captação, referências e capa; o link expira.

### Financeiro (detalhes)

- **DRE** de 12 meses por competência com receita bruta e líquida, recorrente e
  variável, e despesas separadas em variável, operacional, administrativa,
  comercial e financeira.
- **Fluxo de caixa**: caixa inicial, movimento do mês, caixa final e extrato.
- **Configurações do ano**: saldo inicial, clientes iniciais, metas de receita
  (anual e de crescimento), dias úteis por mês (multiplicam VR e VT) e a
  **régua de bônus por ranking** do OnTrack, que entra na folha.

### Equipe

- Cadastro do colaborador com foto, clientes que atende, emblemas e chaves
  para participar ou não da pauta, do OnTrack e do Hall da Fama; o acesso ao
  sistema é criado automaticamente e pode ser desativado ou reativado.
- Perfil com produtividade diária, média, distribuição por cliente, evolução
  no ranking, coleção de emblemas e skills.
- **Desligamento**: escolher o que fazer com cada tarefa aberta (mover para
  outra pessoa, deixar sem responsável ou excluir), separando criação,
  onboarding e ajustes de cliente.

### Configurações e white label

Logos para modo claro e escuro (inclusive versão recolhida), imagem de fundo e
rodapé dos PDFs gerados, modelos de permissão, clientes e colaboradores.

### Comunicação e conhecimento

- Chat por canais com busca, membros, edição e exclusão de mensagens e
  **exportação da conversa em PDF**.
- Academy com páginas protegidas por senha (com dica), que administradores
  abrem sem senha, e exportação em PDF.
- Lembretes com recorrência em dias úteis, adiar e parar a repetição.

### Integrações abertas

- **Chaves de API** com escopos (leitura de clientes, tarefas e workspace;
  leitura e escrita de chats; comentários em posts) e validade opcional.
- **Webhooks** com eventos de chat, comentários e movimentação de packs e
  posts, e histórico de entregas.

### Lixeira

Restaura cards, ciclos, conversas, documentos, packs e posts (acesso só de
administradores).
