*** Settings ***
Documentation    Cenários de visualizar reservas dentro do módulo de reservations
Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
RESERVATIONS-FE-002: Visualizar reservas pessoais na interface
    [Documentation]    Visualizar minha reserva após comprar uma reserva
    [Tags]    ver_reservas_pessoais    reserva
    Feature Reservations UI
    Allure Test Info    Teste de criar reserva com dados inválidos    Low

    Allure Step    Criar uma nova reserva para realizar o teste
    Criar uma reserva

    Allure Step    Fazer login para realizar o teste
    Fazer Login com user criado para teste

    Allure Step    Abrir página de minhas reservas
    Ir para página de minhas reservas

    Allure Success    Reservas pessoais visualizadas com sucesso.
    Allure Attach Screenshot    Evidência da reserva
    Confirmar se a reserva está correta
RESERVATIONS-FE-007: Tentar acessar reservas pessoais sem autenticação
    [Documentation]    Tenta acessar minhas reservas sem fazer login
    [Tags]    ver_reservas_pessoais_sem_login    reserva
    Feature Reservations UI
    Allure Test Info    Teste de tentar acessar minhas reservas seu autenticação   High

    Allure Step    Criar uma nova reserva para realizar o teste
    Criar uma reserva
    
    Allure Step    Abrir página de início
    Ir para página de início
    
    Allure Success    Minhas reservas não está disponível para acessar.
    Allure Attach Screenshot    Evidência do sucesso
    Tentar ir para página de minhas reservas sem fazer login