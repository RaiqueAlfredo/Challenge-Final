*** Settings ***
Documentation        Cenários de criar reservas dentro do módulo de reservations
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session

*** Test Cases ***
RESERVATIONS-FE-004: Criar reserva na interface
    [Tags]    criar_reserva
    Criar uma reserva
    Fazer Login user comum
    Ir para página de minhas reservas
    Confirmar se a reserva está correta

RESERVATIONS-FE-009: Tentar criar uma nova reserva com dados inválidos pela interface
    [Tags]    criar_reserva_invalida
    Fazer Login user comum