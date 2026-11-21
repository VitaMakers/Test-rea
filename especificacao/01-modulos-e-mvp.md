# Módulos e MVP

Cada módulo pode ser **ligado ou desligado por workspace**. O MVP é o conjunto
mínimo para o sistema já ser útil; o resto entra em fases.

## MVP (fase 1) — o núcleo

Objetivo: um social media ou uma agência pequena já consegue trabalhar de ponta
a ponta, da tarefa à aprovação do cliente.

1. **Contas e workspace**
   - Login, cadastro, convite de membros.
   - Workspace no modo **agência** ou **empresa**.
   - Papéis básicos (dono, gestor, membro) e o essencial de permissões.
2. **Clientes / marcas**
   - Cadastro de cada cliente (no modo agência) ou da marca própria (modo empresa).
   - Dados básicos, logo, cor, contatos, redes.
3. **Produção (quadro)**
   - Quadro Kanban com etapas configuráveis (ex.: Ideia → Roteiro → Produção →
     Revisão → Aprovação → Agendado → Publicado).
   - Cada card é um **conteúdo** (post, reels, story, carrossel, tarefa interna).
   - Responsáveis, prazos, anexos, comentários internos.
4. **Tarefas e checklist**
   - Tarefas dentro do conteúdo ou soltas, com responsável e prazo.
5. **Calendário editorial**
   - Visão mensal/semanal dos conteúdos, com prévia simples do feed.
6. **Portal e aprovação do cliente**
   - Link por cliente com **PIN** ou e-mail autorizado.
   - Cliente aprova, reprova ou pede ajuste; comentário por conteúdo.
   - Automação mínima: aprovar move o card para "Aprovado", pedir ajuste move
     para "Revisão".

Com isso o ciclo completo já roda. Tudo o mais é incremento.

## Fase 2 — operação da equipe

7. **Controle de horas** — cronômetro por tarefa, estimado × realizado.
8. **Automações por evento** — "quando X, mover para Y", dono por etapa, SLA.
9. **Chat interno** — mensagens por workspace, menções, cartões de tarefa.
10. **Notificações** — no app e por e-mail; base para WhatsApp depois.
11. **Dashboard gerencial** — produção, atrasos, carga por pessoa.

## Fase 3 — financeiro

12. **Lançamentos** — a receber, a pagar, competência × caixa, baixa com
    juros/multa/desconto.
13. **Contas, categorias, fornecedores.**
14. **Contratos e recorrência** — mensalidade por cliente, MRR, churn, LTV.
15. **DRE e fluxo de caixa.**
16. **Folha da equipe** — salário, benefícios, bônus.
17. **Cobrança ao cliente** — integração Asaas, com régua de cobrança.

## Fase 4 — publicação e relatórios

18. **Agendamento e publicação** — Instagram/Facebook (Meta) e TikTok via APIs
    oficiais.
19. **Analytics das redes** — métricas por conteúdo e por cliente.
20. **Relatórios ao cliente** — relatório com link público e PDF.
21. **Conferência pós-publicação** — checar o que saiu e sinalizar erro.

## Fase 5 — gestão de pessoas e processos (opcionais)

22. **Onboarding de cliente** — checklist dos primeiros dias.
23. **Fluxos de produção em cascata** — um modelo dispara tarefas encadeadas.
24. **Gamificação** — ciclos, metas por pontos, emblemas, ranking, modo TV.
25. **Base de conhecimento interna** — processos e treinamentos da equipe.
26. **Reuniões e atas** — com Google Agenda.

## Fase 6 — plataforma

27. **White label completo** — domínio próprio, app com a marca da agência.
28. **API pública e webhooks.**
29. **Agentes de IA** — geração de legendas, busca de pautas, assistente no chat.
30. **Administração da plataforma** (se a Virtù for vendida a terceiros) —
    workspaces, planos, uso, suporte.

## Mapa de módulo por plano (rascunho) **[DECIDIR]**

| Plano     | Público-alvo         | Módulos                               |
| --------- | -------------------- | ------------------------------------- |
| Essencial | autônomo             | Fase 1                                |
| Equipe    | agência pequena      | Fases 1–2                             |
| Pro       | agência estabelecida | Fases 1–4                             |
| Studio    | agência grande       | Tudo, incl. gamificação e white label |

Os limites (nº de clientes, membros, armazenamento) ficam para depois.
