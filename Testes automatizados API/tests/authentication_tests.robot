*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Authentication"

Resource    ../keywords/authentication_keywords.resource
Resource    ../support/allure_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
AUTH-BE-002: Login de usuário
    [Documentation]    Teste de login com usuário válido
    [Tags]    login_válido
    Feature Authentication
    Allure Test Info    Teste de login com credenciais válidas    High

    Allure Step    Preparar dados de login
    Payload login usuário comum
    
    Allure Step    Executar login
    POST endpoint /auth/Login

    Allure Step    Validar resposta de sucesso
    Allure Attach Response    ${resp.json()}
    Validar se o login foi realizado com sucesso
    
    Allure Success    Login realizado com sucesso.
    Validar Status Code "200"
AUTH-BE-006: Registro com e-mail já existente
    [Documentation]    Teste de registro com e-mail já existente
    [Tags]    registro_email_dup
    Feature Authentication
    Allure Test Info    Teste de registro com e-mail já existente    High

    Allure Step    Preparar dados de registro com e-mail já existente
    Payload registro com email duplicado

    Allure Step    Executar registro
    POST endpoint /auth/register

    Allure Step    Validar resposta de erro
    Allure Attach Response    ${resp.json()}
    Validar se retorna mensagem informando que já existe usuário com esse email

    Allure Success    API rejeitou corretamente o email duplicado.
    Validar Status Code "400"
AUTH-BE-007: Login com credenciais inválidas
    [Documentation]    Login com credenciais inválidas
    [Tags]    login_inválido
    Feature Authentication
    Allure Test Info    Teste de login com credenciais inválidas    High

    Allure Step    Preparar dados inválidos para login
    Payload login com credenciais inválidas

    Allure Step    Executar loing
    POST endpoint /auth/login com credenciais inválidas

    Allure Step    Validar resposta de erro
    Allure Attach Response    ${resp.json()}
    Validar se retorna mensagem informando que as credenciais são inválidas

    Allure Success    API rejeitou corretamente o login inválido.
    Validar Status Code "401"