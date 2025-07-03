*** Settings ***
Documentation    Ações e elementos na página de profile

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource
Resource    ../base.resource

*** Keywords ***
Abrir página de perfil
    Click    ${profile}
    Wait For Elements State    ${user_page_h1}    visible    5
    Get Text    ${user_page_h1}    equal    Meu Perfil
Verificar informações do perfil
    ${user}    Get Fixture    auth    user
    Wait For Elements State    ${user_page_h2}    visible    5
    Get Text    ${user_page_h2}    equal    Informações Pessoais
    Wait For Elements State    ${user_page_name}    visible    5
    Get Text    ${user_page_name}    equal    ${user}[user_valido][name]
    Take Screenshot
Atualizar nome de perfil e salvar alterações
    [Arguments]    ${user}
    Click    ${user_page_name}
    Press Keys    ${user_page_name}    Control+a
    Sleep    1s
    Press Keys    ${user_page_name}    Delete
    Take Screenshot
    Sleep    1s
    Type Text    ${user_page_name}    ${user}[name]    delay=100ms
    Sleep    2s
    Take Screenshot
    Wait For Elements State    ${user_page_alert_changes}    enabled    5s
    Press Keys    ${user_page_name}    Enter
Verificar se salvou as alterações
    Wait For Elements State    ${user_page_alert_succes}    visible    5
    Get Text    ${user_page_alert_succes}    equal    Perfil atualizado com sucesso
    Sleep    2s
    Take Screenshot
Validar se informa para preencher os campos
    ${validation_message}=    Get Property    ${user_page_name}    validationMessage
    Should Contain    ${validation_message}    Preencha este campo
    Sleep    2s
    Take Screenshot