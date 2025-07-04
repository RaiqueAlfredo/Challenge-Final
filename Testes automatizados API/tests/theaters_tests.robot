*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Theaters"

Resource    ../keywords/theaters_keywords.resource
Resource    ../support/allure_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
THEATERS-BE-003: Criar cinema com dados válidos
    [Documentation]    Teste de criar um novo cinema
    [Tags]    criar_cinema_valido
    Feature Theaters
    Allure Test Info    Teste de criar um novo cinema com dados válidos    High

    Allure Step    Remover o cinema do banco de dados antes do teste
    Remover theater do database para o teste

    Allure Step    Executar login como admin antes do teste
    Login usuário admin

    Allure Step    Preparar dados válidos para o teste
    Payload criar cinema com dados válidos

    Allure Step    Executar criação de um novo cinema
    POST endpoint /theaters

    Allure Step    Validar resposta de sucesso
    Allure Attach Response    ${resp.json()}
    Validar se o cinema foi criado corretamente

    Allure Success    Cinema criado com sucesso.
    Validar Status Code "201"
THEATERS-BE-006: Criar cinema com payload inválido
    [Documentation]    Teste de criar cinema com dados inválidos
    [Tags]    criar_cinema_invalido
    Feature Theaters
    Allure Test Info    Teste de tentar criar um novo cinema com dados inválidos    High

    Allure Step    Executar login como admin para realizar o teste
    Login usuário admin

    Allure Step    Preparar dados inválidos para o teste
    Payload criar cinema com dados inválidos

    Allure Step    Executar a criação de cinema com dados inválidos
    POST endpoint /theaters com dados inválidos

    Allure Step    Validar resposta de erro
    Allure Attach Response    ${resp.json()}
    Validar se retorna mensagem de erro informando os dados inválidos

    Allure Success    API rejeitou corretamente a criação de um cinema com dados inválidos.
    Validar Status Code "400"