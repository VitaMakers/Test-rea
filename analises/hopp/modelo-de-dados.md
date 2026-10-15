# Hopp: modelo de dados e API observados

Montado a partir dos dados que a página pública `www.hopp.bio/wix` traz
embutidos (`__doppe_viewer_app_data__.pageData`) e das rotas de API que o REA
encontrou no pacote do painel. Lista só **nomes** de campos e rotas, nunca
valores ou dados de usuários.

Serve de referência para desenhar o nosso banco. Não é para copiar.

## Entidades

### Conta (usuário Hopp)

Subdomínio/nome da conta, nome de exibição, foto, plano gratuito ou pago,
página principal, página do speed dial, status de bloqueio, onboarding em
andamento e configurações (banner de cookies, marca d'água, banner do
rodapé, selo de verificado, páginas de produto/serviço/evento/post ativas).
Uma pessoa pode ter várias contas e convidar **colaboradores** com papéis.

### Página (`BymoPage`)

Guardada como um documento com:

- `bymoTemplateId`: tipo de página (página de blocos ou speed dial);
- `bymoPageProps`: todo o conteúdo e a aparência (abaixo);
- status (rascunho/publicada), nome, revisões;
- configurações de SEO (título, descrição, indexação), prévia social (título,
  descrição e imagem, com versão própria para o X), favicon, código HTML no
  `<head>` e no início do `<body>`, cache ligado/desligado.

`bymoPageProps` é dividido assim:

| Grupo            | Campos                                                                                                                                                                                                                                                                                                         |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Perfil           | foto, máscara da foto, capa, nome, selo de verificado, bio, máximo de linhas da bio, fotos de destaque e opacidade                                                                                                                                                                                             |
| Redes sociais    | lista de {rede, url}; tipo de ícone, estilo do botão, tamanho, modo de cor, aparência                                                                                                                                                                                                                          |
| Blocos           | `actions[]` (abaixo), título da lista, aparência da lista, configurações de bloco primário e secundários                                                                                                                                                                                                       |
| Páginas internas | `innerPages[]` e páginas padrão para loja, produto, produto digital, serviços, curso, aula, agendamento, eventos, ingresso, blog, post e carrinho                                                                                                                                                              |
| Navegação        | menu (itens de página ou link, visíveis ou não), cabeçalho do site, busca (aparência, placeholder, autocompletar, o que entra na busca)                                                                                                                                                                        |
| Aparência        | layout da página (Layout1 a Layout14), layout de desktop e largura do conteúdo, paleta de cores (texto, widgets, popups, campos, fundo de desktop), fonte do texto, fonte do nome, tamanho do texto, modelo de botão (estilo, arredondamento, animação ao passar o mouse), imagem de fundo (celular e desktop) |
| Pre-roll         | texto de chamada, texto de pular, segundos para pular sozinho, mostrar cancelar                                                                                                                                                                                                                                |
| Trava            | trava da página inteira e prévia personalizada                                                                                                                                                                                                                                                                 |
| Outros           | idioma, remover banner/marca d'água, banner de cookies, privacidade e termos, Google Analytics, migrações aplicadas                                                                                                                                                                                            |

### Bloco (ação)

Campos comuns a todo bloco:

- `id`, `actionTypeId` (ex.: `io.bymo.action/link`), `name`;
- `enabled`, `deleted` (exclusão lógica);
- `viewType`: botão, na página, na página sem moldura;
- `widgetOpeningMode`: inline ou popup;
- `showActionHeader`, ícone, mídia de banner, descrição da chamada;
- `lockSettings`: trava ligada, tipos de trava, título da prévia;
- `settings`: varia por tipo.

Exemplos de `settings` vistos:

- **Link**: url, título, abrir na mesma aba ou em nova.
- **Prévia de link**: título, descrição em texto rico, imagens, botão, cupom,
  faixa ("SALE"), layout da mídia (proporção, recorte, alinhamento).
- **Lista** (artigos, produtos...): layout (grade, carrossel), tamanho e
  proporção da mídia, o que mostrar por item (imagem, título, descrição,
  texto sobre a imagem), clique do item (prévia, popup, link), itens com
  botões próprios, entrada na busca da página, fonte externa de dados.
- **Inscrição**: e-mail e/ou telefone, opção padrão, texto do botão, caixa de
  consentimento e texto, lista de destino, aviso por e-mail ao dono,
  mensagem de agradecimento.

Campos opcionais usam o formato `{ value, __hidden }`, para o editor lembrar o
valor mesmo quando ele está oculto. Valores automáticos usam
`{ value, __autoValue }`, como "mesma URL de origem".

### Link curto (`bymo-link`)

Endereço (`path`) checado contra duplicidade e bloqueio, destino, página
ligada, modo passagem direta (redireciona sem mostrar página), prévia social
própria. Pode ser criado em lote.

### Speed Dial

Código (`speedDialCode`), destino, imagem, título, visível ou não e cupom
(código, título, descrição, mostrar ou não).

### Contatos e listas

Contatos com inserção ou atualização, exclusão, exportação e caixa de
entrada. Listas de inscrição podem ser criadas, renomeadas e apagadas.
Respostas de formulários ficam guardadas. Há gatilhos do Zapier, mas o código
não mostra quais eventos eles disparam.

### Modelos de página (presets)

Agrupados, ordenáveis, com tradução, ramo de atividade, "vibe" (texto e
imagem gerados) e relatório de análise.

## API do painel

Rotas de produto agrupadas. O prefixo do servidor não aparece no código
junto das rotas e foi omitido.

| Área          | Rotas                                                                                                                                                                                                                                                                                                                   |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Conta         | `user/create`, `user/update`, `user/settings/update`, `user/delete`, `user/duplicate`, `user/roles`, `user/send-invite`, `user/join-invite`, `account/update`, `account/duplicate`, `account/delete`, `account-name-availability`, `user/used-paths`                                                                    |
| Páginas       | `bymo-pages`, `bymo-page/get`, `bymo-page/create`, `bymo-page/save-user-page`, `bymo-page/duplicate`, `bymo-page/delete`, `bymo-page/update/name`, `bymo-page/update/status`, `bymo-pages-revisions`, `bymo-page/get-violated-features`, `page/:id/preview`, `page/generate-preview-token`, `page/revoke-preview-token` |
| Links         | `bymo-links`, `bymo-link/create`, `bymo-link/update`, `bymo-link/update-path`, `bymo-link/update-passthrough`, `bymo-link/update-social-share-settings`, `bymo-link/is-path-available`, `bymo-link/is-blocked`, `bymo-link/bulk-create`, `bymo-link/delete`, `search-links/bulk-create`, `search-links/export`          |
| Speed Dial    | `account/setup-speed-dial`, `account/remove-speed-dial`, `speed-dial-lnk/update`, `speed-dial-lnk/update-code`                                                                                                                                                                                                          |
| Estatísticas  | `user/pages-analytics`, `user/links-analytics`, `user/bymo-page-analytics`, `user/speed-dial-analytics`, `user/speed-dial-links-analytics`, `page/actions-analytics`, `page/actions-cta-buttons-analytics`, `page/actions-items-analytics`, `page/lock-actions-analytics`, `page/social-analytics`                      |
| Contatos      | `contacts`, `contacts/upsert`, `contacts/update`, `contacts/delete-contacts`, `contacts/export`, `contacts/inbox`, `contacts/lists` (+ `create`, `update`, `delete`)                                                                                                                                                    |
| Domínio       | `user/domains`, `user/connect-domain`, `user/connected-domain-setup`, `user/disconnect-domain`, `can-connect-domain`                                                                                                                                                                                                    |
| Mídia         | `user/media-manager-upload-url`, `user/ai-context-media-upload-url`                                                                                                                                                                                                                                                     |
| Plano         | `premium/features`, `premium/order-page`, `user/premium-products`, `cancel-premium-subscription`                                                                                                                                                                                                                        |
| Pagamentos    | `stripe/create-account`, `stripe/create-account-setup-link`, `stripe/create-payment-transaction`, `stripe/retrieve-charges`, `stripe/disconnect-account`, `dlocal/create-payment`, `dlocal/start-payment`                                                                                                               |
| Onboarding    | `onboarding/start`, `onboarding/select`, `onboarding/set-onboarding-data`, `onboarding/finish`                                                                                                                                                                                                                          |
| IA            | `ai-chat-stream`, `ai-conversation(s)`, `hopp-project-assistant/conversation(s)`, `ai-artifacts` (+ `regenerate`, `import`, `delete`)                                                                                                                                                                                   |
| Integrações   | `zapier/add-trigger`, `zapier/remove-trigger`, `tiktok/list-videos`, `migration/base44/...`                                                                                                                                                                                                                             |
| Negócio (Wix) | `store-products/...`, `booking-services/...`, `bookings/...`, `events/...`, `blog-posts/...`, `membership-plans/...`, `wix-forms/...`                                                                                                                                                                                   |
