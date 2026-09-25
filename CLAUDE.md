# Site Cini Engenharia

Site estático de www.ciniengenharia.com.br, hospedado no GitHub Pages com domínio próprio (arquivo `CNAME`).
HTML e CSS puros, sem build. O que está no `main` é publicado.

## Regras de trabalho
- Trabalhar uma etapa por vez. Antes de cada etapa, mostrar o que vai mudar e esperar o ok.
- Um commit por etapa, com mensagem descritiva em português.
- Não alterar o texto dos artigos sem pedir.
- Não mexer no `CNAME`.
- Alteração em massa: mostrar antes o diff de 2 ou 3 arquivos de exemplo.
- Ao terminar cada etapa, rodar de novo a checagem de links quebrados.
- Imagens: NÃO inventar, NÃO baixar e NÃO gerar. O dono do site produz as imagens.
- O GitHub Pages diferencia maiúsculas de minúsculas (o Windows não): conferir a grafia exata dos caminhos.

## Convenções
- Imagens: pasta única `/assets/images/`, sem subpastas. Nomes em minúsculas, com hífens, sem acento, sempre `.jpg`.
  - Exceções existentes em `.png`: `cini-engenharia.png` (logo), `favicon.png`, `whatsapp.png`.
- Padrão de nome: `[serviço]-[assunto-da-seção].jpg`. Ex.: `termografia-carga.jpg`, `laudo-spda-validade.jpg`.
- Páginas de serviço: imagens de seção ficam em `.hero-image`, com 50% da largura e sem proporção fixa.
  Padrão: quadradas, 800x800, abaixo de 150 KB.
- Menu: carregado via `fetch("/menu.html")` em cada página.
- CSS em `/assets/css/`: `menu`, `home`, `engenharia`, `spda`, `artigos`, `contato`.
- Caminhos de assets: usar sempre absolutos (`/assets/...`), nunca `../`. (Meta da Etapa 1; até lá o site ainda usa relativos.)

## Estrutura
- `/` home (`index.html`), `/menu.html`, `/sitemap.xml`, `/robots.txt`
- `/servicos/` páginas por cidade (engenheiro eletricista e engenheiro de segurança do trabalho, 13 cidades cada) + `curso-nr12`
- `/servicos-engenharia-eletrica/` 10 serviços
- `/informacoes/[cidade]/[nr10|projeto-eletrico]/` 148 artigos
- `/lista-servicos/`, `/contato/`
- Cidades: bento-goncalves, cachoeirinha, canoas, carlos-barbosa, caxias-do-sul, farroupilha, garibaldi,
  gravatai, lajeado, montenegro, novo-hamburgo, porto-alegre, sao-leopoldo

## Dados da empresa
- WhatsApp / telefone: (51) 99961-3451
- CNPJ: 25.268.313/0001-56
- Endereço e CREA: a informar pelo dono do site.

## Checagem de links
Script em Python que percorre todos os `.html` e `.css` e verifica, com grafia exata: `href`, `src`, `srcset`,
`url()` em CSS, `fetch()`, `og:image`/`twitter:image` e URLs do próprio domínio no JSON-LD; também confere
o sitemap (URLs quebradas e páginas fora dele), páginas órfãs e imagens sem referência.

## Roteiro (em ordem)

### Etapa 1: coisas quebradas
1. Imagens faltando nas páginas de `/servicos-engenharia-eletrica/`: gerar `IMAGENS-FALTANDO.md` listando,
   por página, nome exato do arquivo, texto alt e título da seção. Apontar irregularidades de nome:
   prefixos misturados `laudo-instalacoes-eletricas-*` e `laudo-instalacoes-*`; `nbr-5419-2026.jpg` fora do
   padrão; `projeto-subestacao-ascarel` e `projeto-subestacao-pcb` com o mesmo alt (seção duplicada?).
   Incluir também `curso-nr12.jpg` (og:image de `/servicos/curso-nr12/`).
2. Os 14 artigos de `/informacoes/bento-goncalves/` usam `../../../assets/` (deveria ser `../../../../`) e ficam
   sem CSS e favicon. Trocar os caminhos de assets por absolutos (`/assets/...`) em TODO o site.
3. `/contato/`: falta meta viewport, meta description, canonical e alt nos ícones do WhatsApp.
4. Home referencia `/assets/css/style.css`, que foi apagado. Remover a referência.

### Etapa 2: caminho até o contato
- Botão fixo de WhatsApp (51 99961-3451) e bloco de contato padrão no fim de cada página de cidade, de serviço
  e de artigo, com link `tel:`.
- Home: tornar clicáveis os 3 cards (Elétrica, Segurança, Treinamentos) e fazer um rodapé real
  (contato, CNPJ, CREA).
- `/lista-servicos/`: os 14 serviços sem link, sem H1 e fora do sitemap.
- `/servicos/curso-nr12/` está órfã.
- Criar `404.html`.

### Etapa 3: SEO e dados estruturados
- Os 173 blocos LocalBusiness não têm `address` (dono vai informar o endereço).
- Artigos: trocar para Article/BlogPosting com `datePublished` e `dateModified`.
- Remover do `sameAs` o link para a home do CREA-RS.
- Adicionar `lastmod` ao sitemap.
- Encurtar títulos acima de 65 caracteres (108 páginas) e descriptions acima de 165 (34 páginas).
  Mostrar amostra antes de aplicar em massa.
- Corrigir `@id`/`url` do JSON-LD do artigo de Porto Alegre `estudo-de-viabilidade-para-aumento-de-carga-junto-a-concessionaria`,
  que apontam para uma URL sem o sufixo `-junto-a-concessionaria`.

### Etapa 4: conteúdo (só revisar com o dono, não alterar sozinho)
- Artigos sobre a nova NR-10 (Portaria MTE 737/2026): conferir se consideram a retificação do DOU de
  24/06/2026 no item 10.8.4.
- Páginas de cidade linkam empresas (ex.: Tramontina). Dono vai dizer quais manter.
- Bairros de Carlos Barbosa inconsistentes entre a página de serviço e os artigos.
- Das 418 imagens, 357 são cópias idênticas com nomes diferentes. Avaliar se vale consolidar.

## Andamento
- 25/09/2026: CLAUDE.md criado; checagem de links refeita (ver histórico do git). Etapa 1 ainda não iniciada.
