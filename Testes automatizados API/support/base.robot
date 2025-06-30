*** Settings ***
Documentation    Arquivo para armazenar keywords, variáveis, e librarys usadas nos testes

Library    RequestsLibrary
Library    Collections
Library    String
Library    OperatingSystem
Library    jsonschema
Library    json

Resource    ../support/variables/variables_api.resource

*** Keywords ***
Iniciar sessão
    Create Session    alias=${ALIAS_BASE}    url=${URL_BASE}    headers=${headers}

Finalizar sessão
    Delete All Sessions
    Log    Sessões encerradas.