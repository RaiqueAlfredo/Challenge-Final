*** Settings ***
Documentation    Cenários de login dentro do módulo de authentication

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Finalize Session

*** Test Cases ***
AUTH-FE-002: Login pela interface
    [Tags]    login_user_valido    login
    ${data}    Get Fixture    auth    login
    Abrir página de login
    Preencher formulário para login    ${data}[login_valido]
    Enviar login
    Verificar login com sucesso
AUTH-FE-003: Logout através do menu de navegação
    [Tags]    logout_user    login
    Fazer Login user comum
    Fazer logout do user
AUTH-FE-007: Login com e-mail ou senha inválidos pela interface
    [Tags]    login_user_invalido    login
    ${data}    Get Fixture    auth    login
    Abrir página de login
    Preencher formulário para login    ${data}[login_invalido]
    Enviar login
    Verificar login com credenciais inválidas