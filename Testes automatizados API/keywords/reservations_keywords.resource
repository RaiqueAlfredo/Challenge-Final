*** Settings ***
Documentation    Keywords para ações no módulo de "Reservations"

Resource    ../support/base.robot

*** Keywords ***
# RESERVATIONS-BE-004: Criar nova reserva
POST endpoint /reservations
    [Arguments]    ${payload}=${dados_reserva_valido}
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/reservations
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se a reserva foi criada corretamente
    Should Be Equal    ${resp.json()["success"]}    ${True}
    Should Not Be Empty   ${resp.json()["data"]}   
    Should Not Be Empty    ${resp.json()["data"]["_id"]} 
    Log    success: ${resp.json()["success"]}
    Log    data: ${resp.json()["data"]}
    Log    reserva id: ${resp.json()["data"]["_id"]}
    
# RESERVATIONS-BE-007: Tentar obter reservas sem autenticação
GET endpoint /reservations/me sem autenticação
    [Arguments]    ${status_code_desejado}=401
    ${resp}    GET On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/reservations/me
    ...    headers=${EMPTY}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retornou mensagem de erro informando a necessidade de autenticação
    Should Be Equal    ${resp.json()["success"]}    ${False}
    Should Be Equal    ${resp.json()["message"]}    Not authorized to access this route
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}

# RESERVATIONS-BE-009: Criar reserva com payload inválido
POST endpoint /reservations com payload inválido
    [Arguments]    ${payload}=${dados_reserva_inv}    ${status_code_desejado}=400
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/reservations
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retornar mensagem de erro indicando os problemas no payload
    Should Be Equal    ${resp.json()["success"]}    ${False}
    Should Be Equal    ${resp.json()["message"]}    Resource not found
    Log    BUG CONFIRMADO: API retorna 'Resource not found' em vez de validar payload    WARN
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}
    Log    stack: ${resp.json()["stack"]}
    Fail    BUG: API não valida payload corretamente - retorna 'Resource not found' em vez de 'Validation failed'