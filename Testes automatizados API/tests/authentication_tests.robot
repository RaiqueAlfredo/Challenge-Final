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

    Allure Step    Validar resposta
    Allure Attach Response    ${resp.json()}
    Validar se o login foi realizado com sucesso
    
    Allure Success    Login realizado com sucesso
    Validar Status Code "200"
AUTH-BE-006: Registro com e-mail já existente
    [Documentation]    Para realizar este teste tentei registrar um usuário usando o email recomendado para testar a API em "Sample Users" no README do repositório "cinema-challenge-back"
    [Tags]    registro_email_dup
    Payload registro com email duplicado
    POST endpoint /auth/register
    Validar se retorna mensagem informando que já existe usuário com esse email
    Validar Status Code "400"
AUTH-BE-007: Login com credenciais inválidas
    [Tags]    login_inválido
    Payload login com credenciais inválidas
    POST endpoint /auth/login com credenciais inválidas
    Validar se retorna mensagem informando que as credenciais são inválidas
    Validar Status Code "401"