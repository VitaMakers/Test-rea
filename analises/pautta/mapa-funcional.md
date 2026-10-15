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
