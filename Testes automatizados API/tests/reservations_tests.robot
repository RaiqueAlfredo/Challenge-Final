*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Reservations"
Resource        ../keywords/reservations_keywords.resource

*** Test Cases ***
RESERVATIONS-BE-004: Criar nova reserva
    Log    a

RESERVATIONS-BE-007: Tentar obter reservas sem autenticação
    Log    message

RESERVATIONS-BE-009: Criar reserva com payload inválido
    Log    message