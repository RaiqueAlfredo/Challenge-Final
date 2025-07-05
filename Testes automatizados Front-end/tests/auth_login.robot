*** Settings ***
Documentation    Cenários de login dentro do módulo de authentication

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Finalize Session

*** Test Cases ***
AUTH-FE-002: Login pela interface
    [Documentation]    Teste de login válido pela interface
    [Tags]    login_user_valido    login
    Feature Authentication UI
    Allure Test Info    Tesde de login válido    High

    Allure Step    Preparando dados válidos para o teste
    ${data}    Get Fixture    auth    login

    Allure Step    Abrindo a página pra realizar o teste
    Abrir página de login

    Allure Step    Preenchendo formulário para login
    Preencher formulário para login    ${data}[login_valido]

    Allure Step    Realizar login
    Enviar login

    Allure Success   Login Realizado com sucesso.
    Allure Attach Screenshot    Evidência do sucesso
    Verificar login com sucesso
AUTH-FE-003: Logout através do menu de navegação
    [Documentation]    Teste de realizar logout
    [Tags]    logout_user    login
    Feature Authentication UI
    Allure Test Info    Tesde de realizar logout pelo menu de navegação    Low

    Allure Step    Realizar login para o teste
    Fazer Login user comum

    Allure Success    Logout feito com sucesso.
    Allure Attach Screenshot    Evidência do sucesso
    Fazer logout do user
AUTH-FE-007: Login com e-mail ou senha inválidos pela interface
    [Documentation]    Teste de login com e-amail ou senha inválidos
    [Tags]    login_user_invalido    login
    Feature Authentication UI
    Allure Test Info    Tesde de login inválido    High

    Allure Step    Preparando os dados para o teste
    ${data}    Get Fixture    auth    login

    Allure Step    Abrir a página para realizar o teste
    Abrir página de login

    Allure Step    Preenchendo formulário de login com dados inválidos
    Preencher formulário para login    ${data}[login_invalido]

    Allure Step    Tentar realizar login com dados inválidos
    Enviar login
    
    Allure Success    Login rejeitado com sucesso.
    Allure Attach Screenshot    Evidência do sucesso
    Verificar login com credenciais inválidas