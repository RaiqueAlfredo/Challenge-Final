*** Settings ***
Documentation    Ações e elementos na página de login

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource

*** Keywords ***
Abrir página de login
    New Page    ${BASE_URL}/login
    Wait For Elements State    ${login_page_h1}    visible    5
    Get Text    ${login_page_h1}    equal    Login
Preencher formulário para login
    [Arguments]    ${user}
    Fill Text    ${login_page_email}    ${user}[email]
    Fill Text    ${login_page_password}    ${user}[password]
Enviar login
    Click    ${login_page_entrar}
Verificar login com sucesso
    Wait For Elements State    ${home_title}    visible    5
    Get Text    ${home_title}    equal    Welcome to Cinema App
    Take Screenshot
Verificar login com credenciais inválidas
    ${validation_message}=    Get Property    ${login_page_email}    validationMessage
    Should Contain    ${validation_message}    @
    Should Contain    ${validation_message}    Inclua um "@" no endereço de e-mail
    Take Screenshot