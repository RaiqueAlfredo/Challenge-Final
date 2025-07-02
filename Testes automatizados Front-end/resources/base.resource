*** Settings ***
Documentation    Librarys, resources e Keywords para ações globais

Library    JSONLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    RequestsLibrary
Library    libs/database.py

Resource    ../resources/env.resource
Resource    ../resources/selectors.resource

Resource    ../resources/pages/HomePage.resource
Resource    ../resources/pages/LoginPage.resource
Resource    ../resources/pages/MoviePage.resource
Resource    ../resources/pages/RegistrationPage.resource
Resource    ../resources/pages/ReservationPage.resource
Resource    ../resources/pages/SessionPage.resource
Resource    ../resources/pages/UserPage.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page    ${BASE_URL}
Finalize Session
    Delete All Sessions
    Log    Sessões encerradas.

# Helper para pegar o arquivo json e o cenário desejado dentro dele
Get Fixture
    [Arguments]    ${file_name}    ${scenario}
    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    RETURN    ${data}[${scenario}]

# Helpers para fazer login como user comum ou admin e verificar se foi feito corretamente
Fazer Login user comum
    ${data}    Get Fixture    auth    login
    Log    Tentando login com: ${data}[login_valido]
    Abrir página de login
    Preencher formulário para login    ${data}[login_valido]
    Enviar login
    Verificar login com sucesso
Fazer Login user admin
    ${data}    Get Fixture    auth    login
    Log    Tentando login com: ${data}[login_admim_valido]
    Abrir página de login
    Preencher formulário para login    ${data}[login_admin_valido]
    Enviar login
    Verificar login com sucesso
Fazer Login com user criado para teste
    ${data}    Get Fixture    auth    login
    Log    Tentando login com: ${data}[login_user_test]
    Abrir página de login
    Preencher formulário para login    ${data}[login_user_test]  
    Enviar login
    Verificar login com sucesso
# Helper para fazer logout do user
Fazer logout do user
    Fazer logout
    Wait For Elements State    ${login_page_h1}    visible    5
    Get Text    ${login_page_h1}    equal    Login
    Take Screenshot

# Helpers abaixo para resetar usuário no banco de dados
Reset user from database
    ${user}    Get Fixture    auth    user
    Remove user from database    ${user}[user_valido][name]
    Abrir página de cadastro
    Preencher formulário para cadastro    ${user}[user_valido]
    Enviar cadastro
    Verificar cadastro com sucesso
Reset user from database para teste
    ${name_update}    Create Dictionary    name=Usuario Test Put
    Remove user from database    ${name_update}[name]
    Reset user from database