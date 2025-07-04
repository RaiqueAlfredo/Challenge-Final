*** Settings ***
Documentation    Cenários de reset de assentos dentro do módulo de sessões
Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
SESSIONS-FE-008: Resetar os assentos de uma sessão existente para disponíveis pela interface
    [Tags]    resetar_assentos    sessao
    Reset user from database para teste
    Fazer Login com user criado para teste
    Ir para seleção de assentos
    Selecionar assentos
    Ir para pagamento e finalizar compra
    Verificar se a compra foi um sucesso
    Fazer logout
    Fazer Login user admin
    Ir para seleção de assentos
    Resetar assentos para disponíveis
    Confirmar se assentos foram resetados