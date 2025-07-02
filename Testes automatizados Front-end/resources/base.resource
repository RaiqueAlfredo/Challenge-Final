*** Settings ***
Documentation    Librarys, resources e Keywords para ações globais

Library    JSONLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    RequestsLibrary

Resource    ../resources/env.resource
Resource    ../resources/selectors.resource

Resource    ../resources/pages/LoginPage.resource
Resource    ../resources/pages/HomePage.resource

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
    Abrir página de login
    Preencher formulário para login    ${data}[login_valido]
    Enviar login
    Verificar login com sucesso
Fazer Login user admin
    ${data}    Get Fixture    auth    login
    Abrir página de login
    Preencher formulário para login    ${data}[login_admin_valido]
    Enviar login
    Verificar login com sucesso
# Helper para fazer logout do user
Fazer logout do user
    Fazer logout
    Wait For Elements State    ${login_page_h1}    visible    5
    Get Text    ${login_page_h1}    equal    Login
    Take Screenshot