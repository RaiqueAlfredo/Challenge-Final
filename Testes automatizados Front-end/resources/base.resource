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
Resource    ../resources/allure_keywords.resource

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
    Log    Tentando login com: ${data}[login_admin_valido]
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
    ${removed_count}    Remove reservations by user name    ${user}[user_valido][name]
    Log    Removed ${removed_count} reservations
    Remove user from database    ${user}[user_valido][name]
    Abrir página de cadastro
    Preencher formulário para cadastro    ${user}[user_valido]
    Enviar cadastro
    Verificar cadastro com sucesso
Reset user from database para teste
    ${name_update}    Create Dictionary    name=Usuario Test Put
    Remove user from database    ${name_update}[name]
    Reset user from database

# Helper abaixo para ir direto aos detalhes do filme
Ir para detalhes de filme
    Ir para página de filmes em cartaz
    Clicar em ver detalhes de um filme especifício
    Verificar detalhes completos do filme

# Helpers abaixo para ajudar a fazer uma reserva mais rápido
Ir para seleção de assentos
    Ir para detalhes de filme
    Clicar em selecionar assentos para ir a seleção
Criar uma reserva
    Resetar assentos antes do teste
    Reset user from database para teste
    Fazer Login com user criado para teste
    Ir para seleção de assentos
    Selecionar assentos
    Ir para pagamento e finalizar compra
    Verificar se a compra foi um sucesso
    Fazer logout
    Resetar assentos antes do teste

# Helpers abaixo para resetar assentos da sessão
Resetar assentos antes do teste
    Fazer Login user admin
    Ir para seleção de assentos
    Resetar assentos para disponíveis
    Confirmar se assentos foram resetados
    Fazer logout