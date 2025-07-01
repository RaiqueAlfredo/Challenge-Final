*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Theaters"

Resource        ../keywords/theaters_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
THEATERS-BE-003: Criar cinema com dados válidos
    [Tags]    criar_cinema_valido
    Login usuário admin
    Payload criar cinema com dados válidos
    POST endpoint /theaters
    Validar se o cinema foi criado corretamente
    Validar Status Code "201"
THEATERS-BE-006: Criar cinema com payload inválido
    [Tags]    criar_cinema_invalido
    Login usuário admin
    Payload criar cinema com dados inválidos
    POST endpoint /theaters com dados inválidos
    Validar se retorna mensagem de erro informando os dados inválidos
    Validar Status Code "400"