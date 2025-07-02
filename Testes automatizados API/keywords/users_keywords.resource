*** Settings ***
Documentation    Keywords para ações no módulo de "Users"

Resource    ../support/base.robot

*** Keywords ***
# USER-BE-002: Obter detalhes de usuário por ID
GET endpoint /users/id-user
    [Arguments]    ${id_user}=${user_id}
    ${resp}    GET On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/users/${id_user}
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retornou os detalhes do usuário corretamente
    [Arguments]    ${id_user}=${user_id}
    Should Be Equal    ${resp.json()["success"]}    ${True}
    Should Be Equal    ${resp.json()["data"]["_id"]}    ${id_user}
    Should Not Be Empty    ${resp.json()["data"]}
    Log    success: ${resp.json()["success"]}
    Log    data: ${resp.json()["data"]}
    Log    user ID: ${resp.json()["data"]["_id"]}

# USER-BE-003: Excluir usuário por ID
DELETE endpoin /users/id-user
    [Arguments]    ${id_user}=${user_id}
    ${resp}    DELETE On Session   
    ...    alias=${ALIAS_BASE}
    ...    url=/users/${id_user}
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se usuário foi removido com sucesso
    Should Be Equal    ${resp.json()["success"]}    ${True}
    Should Be Equal    ${resp.json()["message"]}    User removed
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}