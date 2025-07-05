*** Settings ***
Documentation    Cenários de criar reservas dentro do módulo de reservations

Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
RESERVATIONS-FE-004: Criar reserva na interface
    [Documentation]    Teste de criar reserva
    [Tags]    criar_reserva    reserva
    Feature Reservations UI
    Allure Test Info    Teste de criar reserva   High

    Allure Step    Comprando uma reserva
    Criar uma reserva

    Allure Step    Fazer login com o usuário que comprou uma reserva
    Fazer Login com user criado para teste

    Allure Step    Abrindo página de minhas reservas
    Ir para página de minhas reservas

    Allure Success    Reserva criada com sucesso.
    Allure Attach Screenshot    Evidência da reserva criada.
    Confirmar se a reserva está correta
RESERVATIONS-FE-009: Tentar criar uma nova reserva com dados inválidos pela interface
    [Documentation]    Teste de criar uma reserva com dados inválidos
    [Tags]    criar_reserva_invalida    reserva
    Feature Reservations UI
    Allure Test Info    Teste de criar reserva com dados inválidos   High

    Allure Step    Resetando usuário no banco de dados para realizar o teste
    Reset user from database para teste

    Allure Step    Fazer login para realizar o teste
    Fazer Login com user criado para teste

    Allure Step    Abrir página de seleção de assentos
    Ir para seleção de assentos

    Allure Success    Criação de reserva rejeitada.
    Allure Attach Screenshot    Evidência da reserva rejeitada
    Ir para pagamento sem selecionar assentos