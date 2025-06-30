*** Settings ***
Documentation    Keywords para ações no módulo de "Authentication"

Resource    ../support/base.robot

*** Keywords ***
# AUTH-BE-002: Login de usuário
POST endpoint /auth/Login
    [Arguments]    ${payload}=${dados_login_user}
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/auth/login
    ...    json=&{payload}
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se o login foi realizado com sucesso
    Should Be True    ${resp.json()["success"]}
    Should Not Be Empty    ${resp.json()["data"]["token"]}
    ${token}    Set Variable    ${resp.json()["data"]["token"]}
    Set Test Variable    ${auth_token_user}    ${token}
    Log    success: ${resp.json()["success"]}
    Log    token: ${token}

# AUTH-BE-006: Registro com e-mail já existente
POST endpoint /auth/register
    [Arguments]    ${payload}=${dados_regis_dup}    ${status_code_desejado}=400
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/auth/register
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retorna mensagem informando que já existe usuário com esse email
    Should Be Equal    ${resp.json()["success"]}    ${False}
    Should Be Equal    ${resp.json()["message"]}    User already exists
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}

# AUTH-BE-007: Login com credenciais inválidas
POST endpoint /auth/login com credenciais inválidas
    [Arguments]    ${payload}=${dados_login_inv}    ${status_code_desejado}=401
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/auth/login
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retorna mensagem informando que as credenciais são inválidas
    Should Be Equal    ${resp.json()["success"]}    ${False}
    Should Be Equal    ${resp.json()["message"]}    Invalid email or password
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}