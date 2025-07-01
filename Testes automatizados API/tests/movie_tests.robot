*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Movies"

Resource        ../keywords/movies_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
MOVIE-BE-002: Visualizar detalhes do filme
    [Tags]    ver_detalhes_filme
    Reset movie from database
    Login usuário comum
    GET endpoint /movies/id-movie
    Validar se o filme foi detalhado corretamente
    Validar Status Code "200"

MOVIE-BE-006: Criar filme com dados inválidos
    [Tags]    criar_movie_inv
    Login usuário admin
    Payload criar filme com dados inválidos
    POST endpoint /movies com dados inválidos
    Validar se retorna mensagem informando que os dados são inválidos para criar o filme
    Validar Status Code "400"