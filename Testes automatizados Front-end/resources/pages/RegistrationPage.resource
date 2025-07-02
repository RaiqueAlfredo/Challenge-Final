*** Settings ***
Documentation    Ações e elementos na página de register

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource

*** Keywords ***
Abrir página de cadastro
    New Page    ${BASE_URL}/register
    Wait For Elements State    ${register_page_h1}    visible    5
    Get Text    ${register_page_h1}    equal    Cadastro
Preencher formulário para cadastro
    [Arguments]    ${user}
    Fill Text    ${register_page_name}    ${user}[name]
    Fill Text    ${register_page_email}    ${user}[email]
    Fill Text    ${register_page_password}    ${user}[password]
    Fill Text    ${register_page_confirm_password}    ${user}[password]
Enviar cadastro
    Click    ${register_page_button}
Verificar cadastro com sucesso
    Wait For Elements State    ${home_title}    visible    5
    Get Text    ${home_title}    equal    Welcome to Cinema App
    Take Screenshot
Verificar cadastro com credenciais inválidas
    Wait For Elements State    ${register_page_alert}    visible    5
    Get Text    ${register_page_alert}    equal    User already exists
    Take Screenshot