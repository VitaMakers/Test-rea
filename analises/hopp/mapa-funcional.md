# Hopp: mapa funcional (análise com REA)

Análise estática do Hopp (link na bio da Wix), feita em 15/10/2026 com
`rea analyze-javascript-application` (REA 6.5.0) sobre dois pacotes que o
servidor público da Wix entrega a qualquer navegador:

| Pacote                                        | Tamanho | O que é                                             |
| --------------------------------------------- | ------- | --------------------------------------------------- |
| `services/doppe/3.0.10347/user-app.bundle.js` | 0,9 MB  | página pública de um perfil (`www.hopp.bio/<nome>`) |
| `services/doppe/3.0.10347/main.bundle.js`     | 4,8 MB  | painel do criador (`manage.wix.com/hopp/...`)       |

Também foram lidos o site de divulgação (`www.hopp.co`) e os dados que a página
pública de exemplo `www.hopp.bio/wix` traz embutidos.

O REA reconstruiu 1.955 módulos e cerca de 500 rotas, e analisou 1,4 milhão
de nós de código sem erro de leitura.

Este documento descreve **o que** o app faz, com palavras nossas. Nenhum código,
imagem ou marca do Hopp/Wix foi copiado para este repositório.

**Limites:** nada foi executado e não houve login. Regras do servidor, limites
de cada plano, textos das telas (vêm de arquivos de tradução separados) e
comportamento que depende de dados reais não aparecem. Rotas encontradas no
código não provam que estão em uso: várias são de teste, de parceiros
específicos ou do painel interno da Wix.

## Nomes internos

- **Doppe**: nome interno do produto (pacotes, componentes `Doppe...`).
- **Bymo**: nome antigo do núcleo. Uma página é um `BymoPage`, um link curto é
  um `bymo-link` e cada bloco é uma `io.bymo.action/...`.
- **Speed Dial**: código curto que leva a um link (por exemplo, `MASTERCLASS`).

## Tecnologia observada

- Front-end: React 18 (servido pela CDN da Wix), Webpack, um web worker próprio.
- Back-end: API própria em `/_api/...` (o viewer chama `/<nome>/_api`).
- Comércio, reservas, eventos, blog, CRM e formulários: serviços da própria
  Wix, ligados a um "meta site" criado para cada criador.
- Pagamentos: Stripe (conta conectada do criador), dLocal (América Latina) e
  parcerias de cartão (Isracard, desconto bancário).
- Domínio próprio: Name.com (compra e conexão de domínio).
- Integrações: Zapier, TikTok (lista de vídeos), oEmbed de YouTube, Spotify,
  SoundCloud, Apple Music, Vimeo, X e CodePen; Calendly; Patreon; Google Maps;
  Google Analytics.
- IA: assistente de projeto (conversas), criação da página por IA no cadastro,
  geração de temas e imagens.
- Migração: importação de projetos do Base44.
- Suporte e monitoramento: Intercom e Sentry.

## Módulos

### 1. Cadastro e onboarding

Fluxo guiado em `/join/link-in-bio/...`:

1. conta e nome de usuário (checa se o endereço está livre);
2. objetivos e de onde conheceu o produto;
3. **IA ou modelo**: o usuário descreve o negócio e a IA monta um rascunho
   (blueprint, geração da página, escolha de tema), ou escolhe um modelo pronto;
4. dados do perfil (foto, nome, bio) e redes sociais;
5. busca dos links que a pessoa já tem e ações recomendadas;
6. ramo de atividade, dados do negócio, apps a instalar (loja, reservas...);
7. oferta do plano Pro e checkout.

Também existe um fluxo de "páginas instantâneas" (landing pages avulsas) e a
ligação com um site Wix já existente.

### 2. Painel

Telas encontradas (componentes `DoppeDashboard...`):

- **Início / Visão geral**, com atalhos e resumo do desempenho.
- **Páginas**: a página principal da bio, as páginas internas, as landing pages
  e os modelos (presets).
- **Links**: links curtos rastreáveis, com endereço editável, destino alterável,
  modo "passagem direta" e prévia para redes sociais.
- **Busca de links**: criação de links em lote, inclusive a partir da descrição
  de um vídeo do YouTube, e exportação.
- **Speed Dial**: códigos curtos que levam a links, com cupom opcional.
- **Pre-rolls**: tela exibida antes de redirecionar o visitante, com contagem
  e botão de pular.
- **Ferramentas de negócio** e **Gerenciar**: loja, reservas, eventos, blog,
  planos de assinatura, cupons, formulários, CRM, e-mail marketing e automações.
- **Configurações**: dados da conta, domínio, SEO, cookies, idioma,
  colaboradores do projeto e plano.
- **Preços / upgrade / checkout** do plano Pro.

### 3. Editor da página

Componente `DoppeHoppPageEditorPage`, com painel de configurações para cada
tipo de bloco. A página tem:

- **Cabeçalho**: foto (máscara circular ou quadrada), capa, nome com selo de
  verificado, bio com limite de linhas e ícones de redes sociais (27 redes,
  com estilo, tamanho e cor configuráveis).
- **Blocos** (ações): lista ordenável, cada um pode ser ligado/desligado,
  apagado (exclusão lógica), exibido como botão, inline ou em popup, e
  **trancado** (veja o módulo 5).
- **Aparência**: 14 layouts de página, layout próprio para desktop, paleta de
  cores, fonte, tamanho de texto, modelo de botão (estilo, arredondamento,
  animação), imagem de fundo e fotos de destaque.
- **Navegação**: menu com páginas internas, busca na página com
  autocompletar e escolha do que aparece na busca.
- **Publicação**: rascunho e publicação, histórico de versões, link de
  prévia com token, duplicar página.

### 4. Catálogo de blocos

O código registra cerca de 70 tipos (`io.bymo.action/...`). Sem os de
desenvolvimento, os tipos são:

| Grupo    | Blocos                                                                                                                                                                                                 |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Links    | link, prévia de link (cartão), lista de links, botão de navegação, banner, compartilhar, botão de ligar, e-mail, WhatsApp, Telegram, Messenger, salvar contato (vCard), cartão de contato, mapa e rota |
| Conteúdo | conteúdo livre, lista de conteúdos, FAQ, depoimento, contagem regressiva, código/iframe/embed, imóvel, look (outfit)                                                                                   |
| Mídia    | vídeo, lista de vídeos, YouTube, Spotify, SoundCloud, Apple Music, embed do X                                                                                                                          |
| Captação | inscrição (e-mail e/ou telefone, com consentimento), formulário de contato, seguir                                                                                                                     |
| Vendas   | produto, lista de produtos (loja), produto digital e lista de arquivos para baixar, cupons, assinatura e lista de assinaturas, planos de preço, Patreon                                                |
| Agenda   | serviço e lista de serviços (reservas), evento e lista de eventos, Calendly                                                                                                                            |
| Blog     | artigos, post automático (do blog conectado), posts do blog do Hopp                                                                                                                                    |
| Outros   | speed dial, ícone social, pular (skip), placeholder                                                                                                                                                    |

Blocos de lista têm layouts (grade, carrossel...), proporção de mídia, botões
de ação por item e clique que abre prévia, popup ou link.

### 5. Conteúdo trancado

Um bloco pode exigir uma ação do visitante antes de abrir. Os tipos são:
inscrição na lista, preencher formulário, pagamento, código de acesso,
contagem regressiva (libera numa data) e assistir a um vídeo. Também dá para
trancar a página inteira, com título, mídia e texto de prévia próprios.

### 6. Página pública (viewer)

Rotas da página pública de um criador:

`/`, `/:slug` (página interna), `/products`, `/product/:slug`,
`/digital-product/:slug`, `/products/categories/:slug`, `/services`,
`/service/:slug`, `/appointment/:slug`, `/class/:slug`, `/course/:slug`,
`/events`, `/rsvp-event/:slug`, `/ticket-event/:slug`, `/blog`,
`/post/:slug`, `/cart`.

Ela também mostra banner de cookies, link de privacidade e termos, a marca
d'água "feito com" (que o plano pago remove), metatags de SEO e de redes
sociais, favicon e código HTML personalizado no `<head>`.

### 7. Contatos, formulários e e-mail

Contatos com caixa de entrada, listas de inscrição, exportação, exclusão e
ligação com o CRM da Wix. Formulários personalizáveis com respostas.
E-mail marketing e automações (boas-vindas, carrinho abandonado,
acompanhamento).

### 8. Estatísticas

Visitas e cliques por página, por bloco, por botão, por item de lista, por
rede social, por link curto e por speed dial, além do desempenho dos blocos
trancados. A área de negócio tem relatórios de tráfego, comportamento, tempo
real, vendas e insights.

### 9. Planos

O plano Pro libera 44 recursos. Os principais:

- páginas ilimitadas, landing pages, links curtos e troca de destino;
- domínio próprio, SEO, edição da prévia social, favicon, Google Analytics;
- remover o banner e a marca d'água, selo de verificado;
- estatísticas completas, CRM, automações, coleta de telefone, formulários;
- conteúdo trancado, pre-rolls, estilos e modelos avançados;
- receber pagamentos, colaboradores, espaço de mídia, suporte VIP.

A API tem uma rota que lista quais recursos pagos a página usa sem ter o
plano (`get-violated-features`).

### 10. Administração interna

Telas de admin para usuários (com "entrar como"), links, modelos, denúncias de
abuso, pagamentos dLocal, operações longas e conversas de IA. Não fazem parte
do produto para o cliente.

## O que isso indica para o nosso produto

O núcleo que diferencia o Hopp é pequeno: **página = cabeçalho + lista de
blocos tipados + tema**, guardada como um único documento JSON versionado.
Loja, reservas, eventos e blog são serviços já prontos da Wix ligados por
fora. Para o nosso MVP vale construir o núcleo (editor, viewer, links
curtos, captação e estatísticas) e deixar vendas e agenda como integrações.
