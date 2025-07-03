*** Settings ***
Documentation    Cenários de visualizar sessões dentro do módulo de sessões
Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
SESSIONS-FE-001: Visualizar detalhes de uma sessão na interface
    [Tags]    detalhes_sessao
    Fazer Login user comum
    Ir para detalhes de filme
    Verificar sessões disponíveis