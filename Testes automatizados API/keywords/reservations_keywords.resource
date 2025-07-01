*** Settings ***
Documentation    Keywords para ações no módulo de "Reservations"

Resource    ../support/base.robot

*** Keywords ***
# RESERVATIONS-BE-004: Criar nova reserva
# POST endpoint /reservations
#     [Arguments]    ${payload}=${dados_reservation_valido}
#     ${resp}    POST On Session    
#     ...    alias=${ALIAS_BASE}
#     ...    url=/reservations
#     ...    json=&{payload}
#     ...    headers=${headers}
#     Log    Response: ${resp.json()}
#     Set Test Variable    ${resp}
# Validar se a reserva foi criada corretamente
#     Log    message

    
# RESERVATIONS-BE-007: Tentar obter reservas sem autenticação

# RESERVATIONS-BE-009: Criar reserva com payload inválido