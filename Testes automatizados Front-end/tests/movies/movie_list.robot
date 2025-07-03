*** Settings ***
Documentation    Cenários de visualizar lista de filmes dentro do módulo de movies

Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
MOVIE-FE-002: Exibir detalhes do filme na interface
    [Tags]    detalhes_filmes
    Fazer Login user comum
    Ir para página de filmes em cartaz
    Clicar em ver detalhes de um filme especifício
    Verificar detalhes completos do filme