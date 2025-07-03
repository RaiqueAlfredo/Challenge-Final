*** Settings ***
Documentation    Cenários de reset de assentos dentro do módulo de sessões
Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
SESSIONS-FE-008: Resetar os assentos de uma sessão existente para disponíveis pela interface
    [Tags]    resetar_assentos
    Criar uma reserva
    Fazer Login user admin
    Ir para seleção de assentos
    Resetar assentos para disponíveis
    Confirmar se assentos foram resetados