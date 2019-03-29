# Web Scraping e WebCrawling

# WS - Uma página web específica ou qualquer fonte
    # Comparação de preços
    # Entender códigos html e CSS
    # Raspagem de dados não envolve apenas a web - pode envolver outras fontes

# WC - Grande conjunto de dados em páginas diferentes através de bots
    # WC é um bot que copiam, analisam e rastreiam conteúdo
    # Processo de rastreamento de dados em páginas web
    
# Web Scraping

# Pacotes para o R
    # RCurl
    # httr
    # XML
    # rvest

# Pacote rvest - para quem não conhece as estruturas de HTML e CSS

    # Instalação do pacote
    install.packages ('rvest')
    library(rvest)

    # Coletando a url do filme: 13 horas - O Soldados Ocultos de Benghazi
    # função read_html

    ?read_html
    filme <- read_html ("http://www.imdb.com/title/tt4172430/")
    class(filme)
    head(filme)
    # Os dados foram extraídos e colocados num objeto do tipo node e do tipo doc. O próximo passo será extrair informação desses dois objetos.

    # Funções html_node e html_text

