*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Reservations"

Resource        ../keywords/reservations_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
RESERVATIONS-BE-004: Criar nova reserva
    [Tags]    criar_reserva_valida
    Reset session from database
    # POST endpoint /reservations
    # Validar se a reserva foi criada corretamente

RESERVATIONS-BE-007: Tentar obter reservas sem autenticação
    Log    message

RESERVATIONS-BE-009: Criar reserva com payload inválido
    Log    message