*** Settings ***
Documentation    Ações e elementos na página de movies

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource

*** Keywords ***
Ir para página de filmes em cartaz
    New Page    ${BASE_URL}/movies
    Wait For Elements State    ${movie_page_h1}    visible    5
    Get Text    ${movie_page_h1}    equal    Filmes em Cartaz
Verificar lista de filmes
    Wait For Elements State    ${movie_page_lists}    visible    5   
    ${count}=    Get Element Count    ${movie_page_cards}
    Should Be True    ${count} >= 16    msg=Deve ter pelo menos 16 filmes
    Log    Encontrados ${count} filmes
    Take Screenshot
Clicar em ver detalhes de um filme especifício
    Wait For Elements State    ${movie_page_btn_detail}    visible    5
    Click    ${movie_page_btn_detail}
    Take Screenshot
Verificar detalhes completos do filme
    # Título
    Wait For Elements State    ${movie_page_h1}    visible
    Should Not Be Empty    ${movie_page_h1}
    
    # Sinopse
    Wait For Elements State    ${movie_page_detail_synopse}    visible
    Should Not Be Empty    ${movie_page_detail_synopse}
    
    # Diretor
    Wait For Elements State    ${movie_page_detail_director}    visible
    Should Not Be Empty    ${movie_page_detail_director}
    
    # Gêneros
    Wait For Elements State    ${movie_page_detail_genres}    visible
    Should Not Be Empty    ${movie_page_detail_genres}
    
    # Duração e Data (geralmente no mesmo elemento meta)
    Wait For Elements State    ${movie_page_detail_meta}    visible
    Should Not Be Empty    ${movie_page_detail_meta}
    Sleep    1s
    Take Screenshot