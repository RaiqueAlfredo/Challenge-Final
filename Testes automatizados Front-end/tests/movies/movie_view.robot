*** Settings ***
Documentation    Cenários de visualizar detalhes de filmes dentro do módulo de movies

Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
MOVIE-FE-001: Listar todos os filmes disponíveis
    [Tags]    lista_de_filmes
    Fazer Login user comum
    Ir para página de filmes em cartaz
    Verificar lista de filmes