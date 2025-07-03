*** Settings ***
Documentation    Ações e elementos na página de início

Library    Browser
Library    FakerLibrary

Resource    ../env.resource
Resource    ../selectors.resource

*** Keywords ***
Fazer logout
    Wait For Elements State    ${logout_button}    visible    5
    Take Screenshot
    Click    ${logout_button}