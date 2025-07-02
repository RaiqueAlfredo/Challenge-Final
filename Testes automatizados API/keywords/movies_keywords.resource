*** Settings ***
Documentation    Keywords para ações no módulo de "Movies"

Resource    ../support/base.robot

*** Keywords ***
# MOVIE-BE-002: Visualizar detalhes do filme
GET endpoint /movies/id-movie
    [Arguments]    ${id}=${movie_id}
    ${resp}    GET On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/movies/${id}
    ...    headers=${headers}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se o filme foi detalhado corretamente
    [Arguments]    ${id}=${movie_id}    ${title}=${movie_title}
    Should Be Equal    ${resp.json()["success"]}    ${True}
    Should Be Equal    ${resp.json()["data"]["_id"]}    ${id}
    Should Be Equal    ${resp.json()["data"]["title"]}    ${title}
    Log    success: ${resp.json()["success"]}
    Log    _id: ${resp.json()["data"]["_id"]}
    Log    title: ${resp.json()["data"]["title"]}

# MOVIE-BE-006: Criar filme com dados inválidos
POST endpoint /movies com dados inválidos
    [Arguments]    ${payload}=${dados_movie_inv}    ${status_code_desejado}=400
    ${resp}    POST On Session    
    ...    alias=${ALIAS_BASE}
    ...    url=/movies
    ...    json=&{payload}
    ...    headers=${headers}
    ...    expected_status=${status_code_desejado}
    Log    Response: ${resp.json()}
    Set Test Variable    ${resp}
Validar se retorna mensagem informando que os dados são inválidos para criar o filme
    Should Be Equal    ${resp.json()["success"]}    ${False}
    Should Be Equal    ${resp.json()["message"]}    Validation failed
    Should Not Be Empty    ${resp.json()["errors"]}
    Log    success: ${resp.json()["success"]}
    Log    message: ${resp.json()["message"]}
    Log    errors: ${resp.json()["errors"]}