# Kiiru: mapa funcional (análise com REA)

Análise estática da parte pública de https://app.kiiru.com.br, feita em 14/10/2026
com `rea analyze-javascript-application` (REA 6.5.0) sobre os 295 arquivos que o
site entrega ao navegador, mais uma busca de rotas, tabelas e funções nesses arquivos.

Este documento descreve **o que** o app faz, com palavras nossas. Nenhum código,
imagem ou marca da Kiiru foi copiado para este repositório.

**Limites:** nada foi executado e não houve login. Regras do servidor, permissões
do banco, conteúdo das funções do servidor e telas que dependem de dados reais
não aparecem. Rotas e chamadas encontradas no código não provam que estão em uso.

## Tecnologia observada

- Front-end: React (Vite), componentes Radix UI, gráficos, animações e editor de texto rico.
- Back-end: Supabase (banco Postgres, login, arquivos e funções do servidor).
- Arquivos de vídeo: Cloudflare R2 (upload assinado e normalização de vídeo).
- Pagamentos: Asaas (assinaturas do SaaS e cobranças da agência para os clientes).
- Publicação em redes: Instagram e TikTok diretos, além dos serviços Post for Me, Zernio e Bundle Social.
- Outros: WhatsApp (avisos e disparos), Sentry (erros), ViaCEP (endereço), servidor MCP próprio e integração com o Claude (`/autorizar-claude`).
- Hospedagem: Vercel.

## Escala

- 56 rotas (telas)
- cerca de 140 tabelas no banco
- 84 funções no banco (RPC)
- 90 funções no servidor (edge functions)
- 12 áreas de armazenamento de arquivos

## Módulos

### 1. Contas, equipe e permissões

Login, cadastro, recuperação de senha, verificação em 2 etapas, convites de membros,
organizações (agências) com papéis e permissões personalizáveis, perfil e configurações.
Rotas: `/auth`, `/forgot-password`, `/reset-password`, `/team`, `/settings`.

### 2. Marcas (clientes da agência)

Cadastro de cada cliente com contatos, metas, datas importantes, reuniões, pastas
de arquivos, acessos guardados, histórico de atividade e membros responsáveis.
Rotas: `/brands`, `/brands/:id`.

### 3. Briefings

Modelos de perguntas, briefing por marca, respostas do cliente com anexos e exportação.
Rotas: `/brands/:brandId/briefings/...`.

### 4. Publicações (núcleo do produto)

Cada post passa por etapas configuráveis em quadro Kanban: responsáveis,
tarefas e checklists, tags, comentários e anotações sobre a arte, arquivos,
legendas-modelo, estimativa de horas, lixeira com restauração e regras de
automação por etapa.
Rotas: `/kanban`, `/calendar`, `/tasks`, `/automations`, `/lixeira`, `/ideas-lab`.

### 5. Calendário e prévia do feed

Calendário editorial com filtros salvos e uma prévia de como o feed do Instagram
ficará. Rotas: `/calendar`, `/preview/feed/:slug`.

### 6. Aprovação pelo cliente

Link com token para o cliente aprovar ou pedir ajustes sem login, com lembretes.
Rotas: `/aprovar/:token`, `/a/:slug/:token`.

### 7. Portal do cliente

Área do cliente com login próprio: painel, aprovações, calendário, feed, briefings,
arquivos, faturas e marca. Rotas: `/portal/:slug/*`, `/enviar-portal`.

### 8. Agendamento e publicação nas redes

Conexão de contas do Instagram e do TikTok e publicação agendada, direta ou pelos
serviços parceiros, com nova tentativa, remoção e leitura de métricas.
Rotas: `/integrations`, `/auth/instagram/callback`, `/auth/tiktok/callback`.

### 9. Campanhas

Agrupam publicações, com responsáveis, tempo gasto por etapa e relatório.
Rotas: `/campaigns`, `/campaigns/:id`.

### 10. Controle de horas

Cronômetro por tarefa, lançamentos manuais, revisão, fechamento automático ao
mudar de etapa e relatório de rentabilidade.

### 11. Relatórios e analytics

Métricas das redes, relatórios do cliente com link público e um painel gerencial
(projetos, horas e financeiro). Rotas: `/analytics`, `/reports`, `/dashboard`,
`/report/:token`.

### 12. Financeiro

Contas, categorias, fornecedores, lançamentos recorrentes, baixas, contratos e
serviços, cobranças ao cliente via Asaas com régua de cobrança.
Rotas: `/financeiro`.

### 13. Mensagens internas

Chat da equipe com grupos, menções, reações, busca e cartões de publicação
dentro da conversa. Rota: `/mensagens`.

### 14. Notificações e WhatsApp

Notificações no app, preferências por pessoa, avisos e disparos em massa via
WhatsApp. Rota: `/notifications`.

### 15. IA

Geração de legendas e um chat com IA dentro do app.

### 16. Assinatura do SaaS

Planos, cupons, página de preços e gestão da assinatura.
Rotas: `/pricing`, `/assinar`.

### 17. Indicação (indique e ganhe)

Cupom de indicação, comissões e posts de divulgação.
Rotas: `/indique-e-ganhe/...`, `/t/:codigo`.

### 18. Suporte e conteúdo

Central de ajuda com coleções e artigos, chamados de suporte, sugestões com votos
e novidades. Rotas: `/ajuda/...`, `/support`, `/feedback`, `/updates`.

### 19. Administração da plataforma

Painel do dono do SaaS: contas, planos, uso de armazenamento, rankings e
entrar como outro usuário. Rotas: `/admin`, `/admin/indicacoes`.

### 20. Extras

Portfólio público (`/nocode-folio`), roteiros compartilháveis (`/roteiro/:token`),
termos e privacidade.
