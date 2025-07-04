*** Settings ***
Documentation    Ações e elementos dentro da página de reservas

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource
Resource    ../base.resource

*** Keywords ***
Ir para página de minhas reservas
    Wait For Elements State    ${reservation_page_go_btn}    visible    10
    Get Text    ${reservation_page_go_btn}    equal    Minhas Reservas
    Click    ${reservation_page_go_btn}
    Wait For Elements State    ${reservation_page_h1}    visible    5
    Get Text    ${reservation_page_h1}    equal    Minhas Reservas
Confirmar se a reserva está correta
    Wait For Elements State    ${reservation_page_id}    visible    10s
    ${reserva_id}=    Get Text    ${reservation_page_id}
    Should Contain    ${reserva_id}    ${codig_8_digits}
    Should Contain    ${reserva_id}    Reserva #
    Log    Código ${codig_8_digits} encontrado na página
    Take Screenshot