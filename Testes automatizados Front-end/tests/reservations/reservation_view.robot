*** Settings ***
Documentation    Cenários de visualizar reservas dentro do módulo de reservations
Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
RESERVATIONS-FE-002: Visualizar reservas pessoais na interface
    [Tags]    ver_reservas_pessoais    reserva
    Criar uma reserva
    Fazer Login com user criado para teste
    Ir para página de minhas reservas
    Confirmar se a reserva está correta
RESERVATIONS-FE-007: Tentar acessar reservas pessoais sem autenticação
    [Tags]    ver_reservas_pessoais_sem_login    reserva
    Criar uma reserva
    Ir para página de início
    Tentar ir para página de minhas reservas sem fazer login