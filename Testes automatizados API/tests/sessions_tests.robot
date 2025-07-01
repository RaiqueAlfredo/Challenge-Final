*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Sessions"

Resource        ../keywords/sessions_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
SESSIONS-BE-003: Criar nova sessão
    [Tags]    criar_sessao_valido
    Login usuário admin
    Reset movie from database
    Reset theater from database
    Payload criar sessão com dados válidos
    POST endpoint /sessions
    Validar se criou uma nova sessão corretamente
    Validar Status Code "201"
SESSIONS-BE-006: Criar sessão com payload inválido
    [Tags]    criar_sessao_invalido
    Login usuário admin
    Payload criar sessão com dados inválidos
    POST endpoint /sessions com dados inválidos
    Validar se retornou mensagem de erro informando sobre os dados inválidos ao criar a sessão
    Validar Status Code "404"