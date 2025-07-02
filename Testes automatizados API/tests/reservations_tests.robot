*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Reservations"

Resource        ../keywords/reservations_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
RESERVATIONS-BE-004: Criar nova reserva
    [Tags]    criar_reserva_valida
    Reset session from database
    Deixar os assentos da sessão disponível para o teste
    Login usuário comum
    Payload criar reserva com dados válidos
    POST endpoint /reservations
    Validar se a reserva foi criada corretamente
    Validar Status Code "201"
RESERVATIONS-BE-007: Tentar obter reservas sem autenticação
    [Tags]    obter_reserva_sem_auth
    Login usuário comum
    GET endpoint /reservations/me sem autenticação
    Validar se retornou mensagem de erro informando a necessidade de autenticação
    Validar Status Code "401"
RESERVATIONS-BE-009: Criar reserva com payload inválido
    [Tags]    criar_reserva_inv
    Login usuário comum
    Payload criar reserva com dados inválidos
    POST endpoint /reservations com payload inválido
    Validar Status Code "400"
    Validar se retornar mensagem de erro indicando os problemas no payload