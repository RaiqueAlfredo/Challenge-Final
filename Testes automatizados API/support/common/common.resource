*** Settings ***
Documentation    Keywords para ações gerais

Resource    ../../support/base.robot
Resource    ../../keywords/authentication_keywords.resource

*** Keywords ***
# Para validar o status code retornado no teste
Validar Status Code "${statuscode}"
    Should Be True    ${resp.status_code} == ${statuscode}
    Log    Status Code: ${statuscode}

# Para importar arquivos jsons
Importar JSON static
    [Arguments]    ${nome_arquivo}
    ${arquivo}    Get File    ${CURDIR}/../../support/fixtures/static/${nome_arquivo}
    ${data}    Evaluate    json.loads('''${arquivo}''')    json
    RETURN    ${data}

# Payloads abaixo para fazer login como usuário normal e como admin
Payload login usuário comum
    ${json}    Importar JSON static    json_auth.json
    ${dados_login_user}    Set Variable    ${json["user_login"]} 
    Set Test Variable    ${dados_login_user}
Payload login usuário admin
    ${json}    Importar JSON static    json_auth.json
    ${dados_login_admin}    Set Variable    ${json["admin_login"]}
    Set Test Variable    ${dados_login_admin}

# Payload abaixo para teste com email duplicado
Payload registro com email duplicado
    ${json}    Importar JSON static    json_auth.json
    ${dados_regis_dup}    Set Variable    ${json["user_email_dup"]}
    Set Test Variable    ${dados_regis_dup}

# Payload abaixo para teste de login com credenciais inválidas
Payload login com credenciais inválidas
    ${json}    Importar JSON static    json_auth.json
    ${dados_login_inv}    Set Variable    ${json["user_login_inv"]}
    Set Test Variable    ${dados_login_inv}

# Helpers
Login usuário comum
    Payload login usuário comum
    POST endpoint /auth/Login
    Validar se o login foi realizado com sucesso
    Validar Status Code "200"
Login usuário admin
    Payload login usuário admin
    POST endpoint /auth/Login
    Validar se o login foi realizado com sucesso
    Validar Status Code "200"