*** Settings ***
Documentation    Keywords para ações gerais

Resource    ../../support/base.robot
Resource    ../../keywords/authentication_keywords.resource
Resource    ../../keywords/movies_keywords.resource

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

# Payload abaixo para criar filme com dados válidos
Payload criar filme com dados válidos
    ${json}    Importar JSON static    json_movie.json
    ${dados_movie_valido}    Set Variable    ${json["movie_valido"]}
    Set Test Variable    ${dados_movie_valido}

# Payload abaixo para teste de criar filme com dados inválidos
Payload criar filme com dados inválidos
    ${json}    Importar JSON static    json_movie.json
    ${dados_movie_inv}    Set Variable    ${json["movie_inv"]}
    Set Test Variable    ${dados_movie_inv}

# Helpers
Login usuário comum
    Payload login usuário comum
    POST endpoint /auth/Login    ${dados_login_user}
    Validar se o login foi realizado com sucesso
    Validar Status Code "200"
Login usuário admin
    Payload login usuário admin
    POST endpoint /auth/Login    ${dados_login_admin}
    Validar se o login foi realizado com sucesso
    Validar Status Code "200"
    ${auth_token_admin}    Set Variable    ${resp.json()["data"]["token"]}
    Set Global Variable    ${auth_token_admin}
    Iniciar sessão
Inserir filme no banco e pegar ID
    [Arguments]    ${movie_data}
    ${movie_id}    Insert movie from database    ${movie_data}
    Set Test Variable    ${movie_id}
    Log    Movie inserted with ID: ${movie_id}
    RETURN    ${movie_id}
Reset movie from database
    Payload criar filme com dados válidos
    ${movie_title}    Set Variable    ${dados_movie_valido}[title]
    Remove movie from database    ${movie_title}
    ${movie_id}    Inserir filme no banco e pegar ID    ${dados_movie_valido}
    Set Test Variable    ${movie_id}
    Set Test Variable    ${movie_title}