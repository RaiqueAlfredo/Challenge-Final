*** Settings ***
Documentation    Cenários de visualizar lista de filmes dentro do módulo de movies

Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
MOVIE-FE-002: Exibir detalhes do filme na interface
    [Documentation]    Teste de exibir detalhes do filme
    [Tags]    detalhes_filmes    filmes
    Feature Movies UI
    Allure Test Info    Teste de tentar acessar minhas reservas seu autenticação   High

    Allure Step    Fazer login para realizar o teste
    Fazer Login user comum
    
    Allure Step    Abrir págine de filmes em cartaz
    Ir para página de filmes em cartaz
    
    Allure Step    Clicar em "ver detalhes" de um filme especifício
    Clicar em ver detalhes de um filme especifício
    
    Allure Success    Detalhes do filme exibido corretamente
    Allure Attach Screenshot    Evidência do filme detalhado
    Verificar detalhes completos do filme