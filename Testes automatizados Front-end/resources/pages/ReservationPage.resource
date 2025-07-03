*** Settings ***
Documentation    Ações e elementos dentro da página de reservas

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource
Resource    ../base.resource

*** Keywords ***
Ir para página de minhas reservas
    New Page    ${BASE_URL}/reservations
    Wait For Elements State    ${reservation_page_h1}    visible    5
    Get Text    ${reservation_page_h1}    equal    Minhas Reservas
Confirmar se a reserva está correta
    ${codig_complete}=    Get Text    ${session_page_reservation_codig}
    ${codig_8_digits}=    Get Substring    ${codig_complete}    0    8
    Log    Código (8 dígitos): ${codig_8_digits}

    ${seletor_dinamico}=    Set Variable    xpath=//h3[contains(text(), "Reserva #") and contains(text(), "${codig_8_digits}")]
    Wait For Elements State    ${seletor_dinamico}    visible    5
    ${seletor_dinamico}    Get Text    xpath=//h3[contains(text(), "Reserva #") and contains(text(), "${codig_8_digits}")]
    Should Contain    ${seletor_dinamico}    ${codig_8_digits}