*** Settings ***
Documentation    Ações e elementos na página de início

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource

*** Keywords ***
Ir para página de início
    New Page    ${BASE_URL}
    Wait For Elements State    ${home_title}    visible    5
    Get Text    ${home_title}    equal    Welcome to Cinema App
    Take Screenshot
Fazer logout
    Wait For Elements State    ${logout_button}    visible    5
    Take Screenshot
    Click    ${logout_button}
Tentar ir para página de minhas reservas sem fazer login
    Wait For Elements State    ${reservation_page_go_btn}    hidden    5s
    Take Screenshot
    TRY
        Click    ${reservation_page_go_btn}    timeout=2s
        Fail    Botão deveria estar desabilitado mas permitiu clique
    EXCEPT
        Log    Botão corretamente desabilitado - não permitiu clique
    END