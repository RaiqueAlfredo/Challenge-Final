*** Settings ***
Documentation    Keywords para ações gerais

Resource    ../../support/base.robot
Resource    ../../keywords/authentication_keywords.resource
Resource    ../../keywords/movies_keywords.resource
Resource    ../../keywords/theaters_keywords.resource
Resource    ../../keywords/sessions_keywords.resource

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

# Payload abaixo para teste de criar filme com dados válidos e depois com dados inválidos
Payload criar filme com dados válidos
    ${json}    Importar JSON static    json_movie.json
    ${dados_movie_valido}    Set Variable    ${json["movie_valido"]}
    Set Test Variable    ${dados_movie_valido}
Payload criar filme com dados inválidos
    ${json}    Importar JSON static    json_movie.json
    ${dados_movie_inv}    Set Variable    ${json["movie_inv"]}
    Set Test Variable    ${dados_movie_inv}

# Payload abaixo para teste de criar cinema com dados válidos e depois com dados inválidos
Payload criar cinema com dados válidos
    ${json}    Importar JSON static    json_theater.json
    ${dados_theater_valido}    Set Variable    ${json["theater_valido"]}
    Set Test Variable    ${dados_theater_valido}
Payload criar cinema com dados inválidos
    ${json}    Importar JSON static    json_theater.json
    ${dados_theater_inv}    Set Variable    ${json["theater_invalido"]}
    Set Test Variable    ${dados_theater_inv}

# Payload abaixo para teste de criar sessão com dados válidos e depois com dados inválidos
Payload criar sessão com dados válidos
    [Arguments]    ${filme_id}=${movie_id}    ${cinema_id}=${theater_id}
    ${json}    Importar JSON static    json_session.json
    ${dados_session_valido}    Set Variable    ${json["session_valido"]}
    Set To Dictionary    ${dados_session_valido}    movie=${filme_id}
    Set To Dictionary    ${dados_session_valido}    theater=${cinema_id}
    Set Test Variable    ${dados_session_valido}
Payload criar sessão com dados inválidos
    ${json}    Importar JSON static    json_session.json
    ${dados_session_inv}    Set Variable    ${json["session_invalido"]}
    Set Test Variable    ${dados_session_inv}

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
Criar novo theater
    Login usuário admin
    Payload criar cinema com dados válidos
    POST endpoint /theaters
    Validar se o cinema foi criado corretamente
    Validar Status Code "201"
Reset theater from database
    Payload criar cinema com dados válidos
    ${theater_name}    Set Variable    ${dados_theater_valido}[name]
    Remove theater from database    ${theater_name}
    Criar novo theater
Criar nova session
    Login usuário admin
    Payload criar sessão com dados válidos
    POST endpoint /sessions
    Validar se criou uma nova sessão corretamente
    Validar Status Code "201"
Reset session from database
    # Preparar dados para identificar sessions antigas
    Payload criar filme com dados válidos
    Payload criar cinema com dados válidos
    ${movie_title}    Set Variable    ${dados_movie_valido}[title]
    ${theater_name}    Set Variable    ${dados_theater_valido}[name]
    # Remover apenas sessions que usam esse movie/theater específico
    Remove sessions by movie title and theater name    ${movie_title}    ${theater_name}
    # Resetar movie e theater (cria novos)
    Reset movie from database
    Reset theater from database
    # Criar nova session
    Criar nova session