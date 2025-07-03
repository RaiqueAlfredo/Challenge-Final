*** Settings ***
Documentation        Cenários de visualizar reservas dentro do módulo de reservations
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session

*** Test Cases ***
RESERVATIONS-FE-002: Visualizar reservas pessoais na interface
    [Tags]    ver_reservas_pessoais
    Fazer Login com user criado para teste
RESERVATIONS-FE-003: Visualizar detalhes de uma reserva na interface
    [Tags]    ver_detalhes_reserva
    Fazer Login com user criado para teste

RESERVATIONS-FE-007: Tentar acessar reservas pessoais sem autenticação
    [Tags]    ver_reservas_pessoais_sem_login
    Fazer Login com user criado para teste