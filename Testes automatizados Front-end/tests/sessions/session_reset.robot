*** Settings ***
Documentation    Cenários de reset de assentos dentro do módulo de sessões
Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
SESSIONS-FE-008: Resetar os assentos de uma sessão existente para disponíveis pela interface
    [Documentation]    Teste de resetar os assentos de uma sessão
    [Tags]    resetar_assentos    sessao
    Feature Sessions UI
    Allure Test Info    Teste de resetar os assentos de uma sessão existente para disponíveis   High

    Allure Step    Resetar usuário no banco de dados para realizar o teste
    Reset user from database para teste

    Allure Step    Fazer login para realizar teste
    Fazer Login com user criado para teste

    Allure Step    Abrir página de seleção de assentos
    Ir para seleção de assentos

    Allure Step    Seleciona assento para o teste
    Selecionar assentos

    Allure Step    Realizando a compra de uma reserva
    Ir para pagamento e finalizar compra

    Allure Success    Compra foi bem sucedida
    Allure Attach Screenshot    Evidência da compra de reserva
    Verificar se a compra foi um sucesso

    Allure Step    Fazendo logout para realizar o teste
    Fazer logout

    Allure Step    Fazer login como admim para realizar o teste
    Fazer Login user admin

    Allure Step    Abrir página de seleção de assentos
    Ir para seleção de assentos

    Allure Step    Resetando os assentos para disponíveis
    Resetar assentos para disponíveis

    Allure Success    Assentos resetados com sucesso.
    Allure Attach Screenshot    Evidência dos assentos resetados.
    Confirmar se assentos foram resetados