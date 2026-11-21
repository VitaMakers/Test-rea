# Virtù — Especificação do produto

Documento vivo. É o "projeto da casa" antes de construir: define o que a Virtù
faz, como os dados se organizam, quem pode o quê e em que ordem construir.
Baseado nas análises em [`../analises/`](../analises/) (Kiiru e Pautta), mas é
um **produto original** — nada de código, marca ou imagem de terceiros.

> Status: rascunho para revisão. Nada aqui foi construído ainda.

## Índice

1. [Visão, públicos e princípios](#visão) — este arquivo
2. [Módulos e MVP](01-modulos-e-mvp.md)
3. [Modelo de dados](02-modelo-de-dados.md)
4. [Permissões e papéis](03-permissoes.md)
5. [Automações e fluxos](04-automacoes-e-fluxos.md)
6. [Decisões técnicas e roteiro](05-roadmap-tecnico.md)

## Visão

A Virtù é um sistema para **organizar a produção de conteúdo e a operação** de
quem cuida de redes sociais: da ideia ao post publicado, passando pela aprovação
do cliente, pelo controle da equipe e pelo financeiro.

Diferente da Kiiru e da Pautta, a Virtù atende **dois públicos no mesmo produto**:

- **Agência** (ex.: Vita Content): atende vários **clientes**, cada um com sua
  marca, seu portal e seu calendário.
- **Empresa / marca própria**: uma equipe interna que cuida das **próprias**
  redes, sem a camada de "cliente externo".

Isso se resolve com um conceito único de **espaço de trabalho (workspace)** que
funciona nos dois modos (ver [modelo de dados](02-modelo-de-dados.md)).

## Públicos e o que cada um precisa

| Público                  | Precisa muito                                                                         | Precisa pouco                       |
| ------------------------ | ------------------------------------------------------------------------------------- | ----------------------------------- |
| Agência de social media  | Portal e aprovação do cliente, produção por cliente, financeiro por cliente, cobrança | —                                   |
| Social media autônomo    | Produção simples, calendário, aprovação por link                                      | Financeiro pesado, gamificação      |
| Empresa / equipe interna | Produção da própria marca, calendário, aprovação interna                              | Portal de cliente externo, cobrança |

A Virtù liga e desliga módulos por workspace, para não pesar para quem é pequeno
nem faltar para quem é grande.

## Princípios de produto

1. **Começar simples.** O MVP cabe na cabeça de um social media sozinho; o resto
   é opcional e se ativa quando precisa.
2. **Modular.** Cada módulo (financeiro, gamificação, onboarding) pode ser
   ligado ou desligado por workspace. Isso também organiza os planos.
3. **O cliente nunca toca o banco direto.** Toda informação que vai para o
   portal do cliente passa por uma camada que decide o que ele pode ver — lição
   tirada da análise da Kiiru e da Pautta.
4. **Privacidade por padrão.** Cada workspace só enxerga os próprios dados,
   garantido no banco (RLS), não só na tela.
5. **Integrações oficiais.** Publicar em redes, cobrar e avisar por WhatsApp é
   feito pelas APIs oficiais (Meta, TikTok, Asaas, WhatsApp, Google), nunca por
   atalhos frágeis.
6. **White label desde cedo.** Cada workspace coloca logo e cor; o portal do
   cliente sai com a marca da agência, não com a da Virtù.

## Princípios técnicos (resumo)

- **Supabase** (Postgres + Auth + Storage + Realtime + Edge Functions) como base,
  com **RLS** isolando cada workspace.
- **Next.js** (React) no front, para web e, depois, um app.
- Detalhes e alternativas em [decisões técnicas](05-roadmap-tecnico.md).

## Decisões em aberto (suas)

Marcadas ao longo dos documentos como **[DECIDIR]**. As principais:

- Nome e cores da marca Virtù (hoje: tema neutro de exemplo).
- Modelo de cobrança da própria Virtù (se um dia for vendida a outras agências).
- Quais módulos entram em cada plano.
- Nome do repositório novo de código.
