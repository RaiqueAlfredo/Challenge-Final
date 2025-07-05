*** Settings ***
Documentation    Cenários de visualizar detalhes de filmes dentro do módulo de movies

Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
MOVIE-FE-001: Listar todos os filmes disponíveis
    [Documentation]    Teste de listar todos os filmes
    [Tags]    lista_de_filmes    filmes
    Feature Movies UI
    Allure Test Info    Teste de ver lista de filmes   Medium

    Allure Step    Fazer login para realizar o teste
    Fazer Login user comum

    Allure Step    Abrir página de filmes em cartaz
    Ir para página de filmes em cartaz

    Allure Success    Lista de filmes exibida corretamente.
    Allure Attach Screenshot    Evidência da lista de filmes
    Verificar lista de filmes