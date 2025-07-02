*** Settings ***
Documentation    Keywords para ações gerais

Resource    ../../support/base.robot
Resource    ../../keywords/authentication_keywords.resource
Resource    ../../keywords/movies_keywords.resource
Resource    ../../keywords/theaters_keywords.resource
Resource    ../../keywords/sessions_keywords.resource
Resource    ../../keywords/users_keywords.resource

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

# Payloads abaixo para registrar usuário com dados válidos e teste com email duplicado
Payload registro com dados válidos
    ${json}    Importar JSON static    json_auth.json
    ${dados_registro_valido}    Set Variable    ${json["user_valido"]}
    Set Test Variable    ${dados_registro_valido}
Payload registro com email duplicado
    ${json}    Importar JSON static    json_auth.json
    ${dados_regis_dup}    Set Variable    ${json["user_email_dup"]}
    Set Test Variable    ${dados_regis_dup}

# Payload abaixo para teste de login com credenciais inválidas
Payload login com credenciais inválidas
    ${json}    Importar JSON static    json_auth.json
    ${dados_login_inv}    Set Variable    ${json["user_login_inv"]}
    Set Test Variable    ${dados_login_inv}

# Payloads abaixo para teste de criar filme com dados válidos e dados inválidos
Payload criar filme com dados válidos
    ${json}    Importar JSON static    json_movie.json
    ${dados_movie_valido}    Set Variable    ${json["movie_valido"]}
    Set Test Variable    ${dados_movie_valido}
Payload criar filme com dados inválidos
    ${json}    Importar JSON static    json_movie.json
    ${dados_movie_inv}    Set Variable    ${json["movie_inv"]}
    Set Test Variable    ${dados_movie_inv}

# Payloads abaixo para teste de criar cinema com dados válidos e com dados inválidos
Payload criar cinema com dados válidos
    ${json}    Importar JSON static    json_theater.json
    ${dados_theater_valido}    Set Variable    ${json["theater_valido"]}
    Set Test Variable    ${dados_theater_valido}
Payload criar cinema com dados inválidos
    ${json}    Importar JSON static    json_theater.json
    ${dados_theater_inv}    Set Variable    ${json["theater_invalido"]}
    Set Test Variable    ${dados_theater_inv}

# Payloads abaixo para teste de criar sessão com dados válidos e dados inválidos
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

# Payloads abaixo para teste de criar reserva com dados válidos e dados inválidos
Payload criar reserva com dados válidos
    [Arguments]    ${sessão_id}=${session_id}
    ${json}    Importar JSON static    json_reservation.json
    ${dados_reserva_valido}    Set Variable    ${json["reserva_valido"]}
    Set To Dictionary    ${dados_reserva_valido}    session=${sessão_id}
    Set Test Variable    ${dados_reserva_valido}
Payload criar reserva com dados inválidos
    ${json}    Importar JSON static    json_reservation.json
    ${dados_reserva_inv}    Set Variable    ${json["reserva_invalido"]}
    Set Test Variable    ${dados_reserva_inv}

# Helpers abaixo para login como user comum e como admin
Login usuário comum
    Payload login usuário comum
    POST endpoint /auth/Login    ${dados_login_user}
    Validar se o login foi realizado com sucesso
    Validar Status Code "200"
    ${auth_token}    Set Variable    ${resp.json()["data"]["token"]}
    Set Global Variable    ${auth_token}
    Iniciar sessão
Login usuário admin
    Payload login usuário admin
    POST endpoint /auth/Login    ${dados_login_admin}
    Validar se o login foi realizado com sucesso
    Validar Status Code "200"
    ${auth_token}    Set Variable    ${resp.json()["data"]["token"]}
    Set Global Variable    ${auth_token}
    Iniciar sessão

# Helpers abaixo para resetar o filme no banco de dados
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
    
# Helpers abaixo para resetar o theater no banco de dados
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

# Helpers abaixo para resetar a sessão no banco de dados
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

# Helpers abaixo para resetar o usuário comum no banco de dados
Inserir user no banco e pegar ID
    [Arguments]    ${user_data}
    ${user_id}    Insert user from database    ${user_data}
    Set Test Variable    ${user_id}
    Log    User inserted with ID: ${user_id}
    RETURN    ${user_id}
Reset user from database
    Payload registro com dados válidos
    ${user_name}    Set Variable    ${dados_registro_valido}[name]
    Remove user from database    ${user_name}
    ${user_id}    Inserir user no banco e pegar ID    ${dados_registro_valido}
    Set Test Variable    ${user_id}

# Helper abaixo para deixar todos os assentos disponíveis na sessão que passar o id
Deixar os assentos da sessão disponível para o teste
    Login usuário admin
    [Arguments]    ${sessão_id}=${session_id}
    ${resp}    PUT On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/sessions/${sessão_id}/reset-seats
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}