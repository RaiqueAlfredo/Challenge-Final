*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Movies"

Resource    ../keywords/movies_keywords.resource
Resource    ../support/allure_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
MOVIE-BE-002: Visualizar detalhes do filme
    [Documentation]    Teste de visualizar corretamente os detalhes do filme
    [Tags]    ver_detalhes_filme
    Feature Movies
    Allure Test Info    Teste de Visualizar os detalhes de um filme corretamente    High

    Allure Step    Preparar o filme no banco de dados antes do teste
    Reset movie from database

    Allure Step    Executar login para realizar o teste
    Login usuário comum

    Allure Step    Encontrar o filme através do ID dele
    GET endpoint /movies/id-movie

    Allure Step    Validar resposta de sucesso
    Allure Attach Response    ${resp.json()}
    Validar se o filme foi detalhado corretamente

    Allure Success    Detalhes do filme visualizados.
    Validar Status Code "200"
MOVIE-BE-006: Criar filme com dados inválidos
    [Documentation]    Teste de criar um filme com dados inválidos
    [Tags]    criar_movie_inv
    Feature Movies
    Allure Test Info    Teste de criar um filme com dados inválidos    High

    Allure Step    Executar login como admin para realizar o teste
    Login usuário admin

    Allure Step    Preparar dados para o teste
    Payload criar filme com dados inválidos

    Allure Step    Executar criação de filme com dados inválidos
    POST endpoint /movies com dados inválidos

    Allure Step    Validar resposta de erro
    Allure Attach Response    ${resp.json()}
    Validar se retorna mensagem informando que os dados são inválidos para criar o filme

    Allure Success    API rejeitou corretamente a criação de filme com dados inválidos.
    Validar Status Code "400"