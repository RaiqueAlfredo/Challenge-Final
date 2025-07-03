*** Settings ***
Documentation    Cenários de registro dentro do módulo de authentication
Resource    ../resources/base.resource


Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
AUTH-FE-001: Registro de usuário pelo formulário na interface
    [Tags]    registro_user_valido
    ${data}    Get Fixture    auth    user
    Remove user from database    ${data}[user_valido][name]
    Abrir página de cadastro
    Preencher formulário para cadastro    ${data}[user_valido]
    Enviar cadastro
    Verificar cadastro com sucesso
AUTH-FE-006: Registro de usuário com e-mail já existente pela interface
    [Tags]    registro_user_email_dup
    ${data}    Get Fixture    auth    user
    Abrir página de cadastro
    Preencher formulário para cadastro    ${data}[user_email_dup]
    Enviar cadastro
    Verificar cadastro com credenciais inválidas