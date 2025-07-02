*** Settings ***
Documentation    Keywords para ações no módulo de "Theaters"

Resource    ../support/base.robot

*** Keywords ***
# THEATERS-BE-003: Criar cinema com dados válidos
POST endpoint /theaters
    [Arguments]    ${payload}=${dados_theater_valido}
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/theaters
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se o cinema foi criado corretamente
    Should Be Equal    ${resp.json()["success"]}    ${True}
    Should Not Be Empty    ${resp.json()["data"]}
    Should Not Be Empty   ${resp.json()["data"]["_id"]}
    ${theater_id}    Set Variable    ${resp.json()["data"]["_id"]}
    Set Test Variable    ${theater_id}
    Log    success: ${resp.json()["success"]}
    Log    data: ${resp.json()["data"]}

# THEATERS-BE-006: Criar cinema com payload inválido
POST endpoint /theaters com dados inválidos
    [Arguments]    ${payload}=${dados_theater_inv}    ${status_code_desejado}=400
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/theaters
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retorna mensagem de erro informando os dados inválidos
    Should Be Equal    ${resp.json()["success"]}    ${False}
    Should Be Equal   ${resp.json()["message"]}    Validation failed
    Should Not Be Empty   ${resp.json()["errors"]}
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}
    Log    errors: ${resp.json()["errors"]}