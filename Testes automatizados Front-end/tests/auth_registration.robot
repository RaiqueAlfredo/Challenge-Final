*** Settings ***
Documentation    Cenários de registro dentro do módulo de authentication
Resource    ../resources/base.resource


Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
AUTH-FE-001: Registro de usuário pelo formulário na interface
    [Documentation]    Registro de usuário válido
    [Tags]    registro_user_valido    cadastro
    Feature Authentication UI
    Allure Test Info    Tesde de registro de usuário    Medium

    Allure Step    Preparando dados válidos para o teste
    ${data}    Get Fixture    auth    user

    Allure Step    Removendo o usuário do banco de dados pra realizar o teste
    Remove user from database    ${data}[user_valido][name]

    Allure Step    Abrindo a página para realizar o teste
    Abrir página de cadastro

    Allure Step    Preenchendo formulário de cadastro
    Preencher formulário para cadastro    ${data}[user_valido]

    Allure Step    Enviando o pedido de cadastro
    Enviar cadastro

    Allure Success    Registro realizado com sucesso
    Allure Attach Screenshot    Evidência do sucesso
    Verificar cadastro com sucesso
AUTH-FE-006: Registro de usuário com e-mail já existente pela interface
    [Documentation]    Registro de usuário com e-mail já existente
    [Tags]    registro_user_email_dup    cadastro
    Feature Authentication UI
    Allure Test Info    Tesde de registro de usuário com e-mail já existente    High

    Allure Step    Preparando dados válidos para o teste
    ${data}    Get Fixture    auth    user
    
    Allure Step    Abrindo a página para realizar o teste
    Abrir página de cadastro
    
    Allure Step    Preenchendo formulário de cadastro
    Preencher formulário para cadastro    ${data}[user_email_dup]

    Allure Step    Enviando o pedido de cadastro
    Enviar cadastro

    Allure Success    Registro rejeitado com sucesso.
    Allure Attach Screenshot    Evidência do sucesso
    Verificar cadastro com credenciais inválidas