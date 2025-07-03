*** Settings ***
Documentation    Ações e elementos dentro da página de detalhes de filmes para Sessões

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource
Resource    ../base.resource

*** Keywords ***
Verificar sessões disponíveis
    Wait For Elements State    ${session_page_h2}    visible    5
    Get Text    ${session_page_h2}    equal    Sessões Disponíveis

    Wait For Elements State    ${session_page_list}    visible    5
    Should Not Be Empty    ${session_page_list}

    ${session_count}=    Get Element Count    ${session_page_date_group}
    Should Be True    ${session_count} >= 1    msg=Deve ter pelo menos 1 sessão
    Log    Encontradas ${session_count} sessões disponíveis

    ${session_time_count}=    Get Element Count    ${session_page_time}
    Should Be True    ${session_time_count} >= 1    msg=Deve ter pelo menos 1 horário das sessões
    Log    Encontradas ${session_time_count} horários de sessões disponíveis

    ${session_theater_count}=    Get Element Count    ${session_page_theater}
    Should Be True    ${session_theater_count} >= 1    msg=Deve ter pelo menos 1 theater
    Log    Encontradas ${session_theater_count} theaters disponíveis

    ${session_price_count}=    Get Element Count    ${session_page_price}
    Should Be True    ${session_price_count} >= 1    msg=Deve ter pelo menos 1 price das sessões
    Log    Encontradas ${session_price_count} prices de sessões disponíveis

    Take Screenshot
Clicar em selecionar assentos para ir a seleção
    Wait For Elements State    ${session_page_btn_select_seat}    enabled    10s
    Click    ${session_page_btn_select_seat}
Selecionar assentos
    Wait For Elements State    ${session_page_select_seat}    enabled    10s
    Click    ${session_page_select_seat}
Resetar assentos para disponíveis
    Wait For Elements State    ${session_page_btn_reset_seat}    enabled    10s
    Take Screenshot
    Click    ${session_page_btn_reset_seat}
Confirmar se assentos foram resetados
    Wait For Elements State    ${session_page_select_seat}    enabled    10s
    Click    ${session_page_select_seat}
    Take Screenshot
Ir para pagamento e finalizar compra
    Wait For Elements State    ${session_page_btn_payment}    enabled    10s
    Click    ${session_page_btn_payment}
    Wait For Elements State    ${session_page_resume}    visible    5
    Should Not Be Empty    ${session_page_resume}
    Sleep    1s
    Take Screenshot
    Click    ${session_page_btn_buy}
Verificar se a compra foi um sucesso
    Wait For Elements State    ${session_page_buy_confirmed}    visible    5
    Get Text    ${session_page_buy_confirmed}    equal    Reserva Confirmada!
    ${codig_complete}=    Get Text    ${session_page_reservation_codig}
    ${codig_8_digits}=    Get Substring    ${codig_complete}    0    8
    Set Test Variable    ${codig_8_digits}
    Sleep    1s
    Take Screenshot