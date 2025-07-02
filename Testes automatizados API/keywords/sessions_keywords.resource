*** Settings ***
Documentation    Keywords para ações no módulo de "Sessions"

Resource    ../support/base.robot

*** Keywords ***
# SESSIONS-BE-003: Criar nova sessão
POST endpoint /sessions
    [Arguments]    ${payload}=${dados_session_valido}
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/sessions
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se criou uma nova sessão corretamente
    Should Be Equal    ${resp.json()["success"]}    ${True}
    Should Not Be Empty    ${resp.json()["data"]}
    Should Not Be Empty   ${resp.json()["data"]["movie"]}
    Should Not Be Empty    ${resp.json()["data"]["theater"]}
    Should Not Be Empty    ${resp.json()["data"]["_id"]}
    ${session_id}    Set Variable    ${resp.json()["data"]["_id"]}
    Set Test Variable    ${session_id}
    Log    success: ${resp.json()["success"]}
    Log    data: ${resp.json()["data"]}
    Log    _id session: ${resp.json()["data"]["_id"]}

# SESSIONS-BE-006: Criar sessão com payload inválido
POST endpoint /sessions com dados inválidos
    [Arguments]    ${payload}=${dados_session_inv}    ${status_code_desejado}=404
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/sessions
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retornou mensagem de erro informando sobre os dados inválidos ao criar a sessão
    Should Be Equal    ${resp.json()["success"]}    ${False}
    Should Be Equal   ${resp.json()["message"]}    Movie not found
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}