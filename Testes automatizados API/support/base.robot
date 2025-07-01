*** Settings ***
Documentation    Arquivo para armazenar keywords, variáveis, e librarys usadas nos testes

Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    jsonschema
Library    json
Library    libs/database.py

Resource    ../support/variables/variables_api.resource
Resource    ../support/common/common.resource


*** Keywords ***
Iniciar sessão
    Run Keyword If    '${auth_token_admin}' != '${EMPTY}'    Set To Dictionary    ${headers}    Authorization=Bearer ${auth_token_admin}
    Create Session    alias=${ALIAS_BASE}    url=${URL_BASE}    headers=${headers}

Finalizar sessão
    Delete All Sessions
    Log    Sessões encerradas.