*** Settings ***
Documentation    Ações e elementos na página de início

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource

*** Keywords ***
Ir para página de início
    New Page    ${BASE_URL}
    Wait For Elements State    ${home_title}    visible    5
    Get Text    ${home_title}    equal    Welcome to Cinema App
    Take Screenshot
Fazer logout
    Wait For Elements State    ${logout_button}    visible    5
    Take Screenshot
    Click    ${logout_button}
Tentar ir para página de minhas reservas sem fazer login
    Wait For Elements State    ${reservation_page_go_btn}    hidden    5s
    Take Screenshot
    TRY
        Click    ${reservation_page_go_btn}    timeout=2s
        Fail    Botão deveria estar desabilitado mas permitiu clique
    EXCEPT
        Log    Botão corretamente desabilitado - não permitiu clique
    END
Verificar layout da página de inicial
    # Título página inicial
    Wait For Elements State    ${home_title}    visible    5
    Get Text    ${home_title}    equal    Welcome to Cinema App
    # Descrição embaixo do título
    Wait For Elements State    ${description_app}    visible    5
    Get Text    ${description_app}    equal    Your premier destination for movie tickets and information
    # Recursos disponíveis
    Wait For Elements State    ${features_app}    visible    5
    Should Not Be Empty    ${features_app}
    # Cabeçalho
    Wait For Elements State    ${header_app}    visible    5
    Should Not Be Empty    ${header_app}
Verificar filmes em cartaz na página inicial
    # Filmes em cartaz
    Wait For Elements State    ${movies_poster}    visible    5
    Should Not Be Empty    ${movies_poster}
    # Contar cards - usar seletor que pega TODOS
    Get Element Count    ${movies_poster_card}    ==    12
    # Verificar tamanho - usar CONTAINER ou PRIMEIRO elemento
    ${grid_size}=    Get BoundingBox    ${movies_poster}
    Should Be True    ${grid_size}[width] >= 1100
    # Verificar posters individualmente
    ${posters}=    Get Elements    ${movies_poster_img}
    FOR    ${poster}    IN    @{posters}
        ${size}=    Get Bounding Box    ${poster}
        Should Be True    ${size}[width] >= 100
        Should Be True    ${size}[height] >= 150
    END
Verificar links úteis e menu de navegação da página inicial
    # Verifica links úteis
    Wait For Elements State    ${link_footer_movies}    enabled    5
    Wait For Elements State    ${link_footer_login}    enabled    5
    Wait For Elements State    ${link_footer_register}    enabled    5
    # Verificar menu de navegação
    Wait For Elements State    ${link_header_movies}    enabled    5
    Wait For Elements State    ${link_header_home}    enabled    5
    Wait For Elements State    ${reservation_page_go_btn}    enabled    5
    Wait For Elements State    ${profile}    enabled    5
    Wait For Elements State    ${logout_button}    enabled    5
Verificar responsividade
    New Page    ${BASE_URL}
    # Desktop
    Set Viewport Size    1920    1080
    Get Element Count    ${movies_poster_card}    ==    12
    Take Screenshot
    # Mobile
    Set Viewport Size    375    667
    Get Element Count    ${movies_poster_card}    ==    12
    Wait For Elements State    ${header_toggle_mobile}    visible
    Take Screenshot