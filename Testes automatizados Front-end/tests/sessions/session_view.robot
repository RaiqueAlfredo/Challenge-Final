*** Settings ***
Documentation    Cenários de visualizar sessões dentro do módulo de sessões
Resource    ../../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
SESSIONS-FE-001: Visualizar detalhes de uma sessão na interface
    [Documentation]    Teste de visualizar detalhes da sessão
    [Tags]    detalhes_sessao    sessao
    Feature Sessions UI
    Allure Test Info    Teste de visualizar detalhes de uma sessão   Low

    Allure Step    Fazer login pra realizar o teste
    Fazer Login user comum

    Allure Step    Ir para página de detalhes de filme, para conseguir visualizar as sessões
    Ir para detalhes de filme

    Allure Success    Detalhes de sessão visualizado corretamente.
    Allure Attach Screenshot    Evidência do sucesso
    Verificar sessões disponíveis