*** Settings ***
Documentation    Cenários de testes relacionados ao home do Cinema App Frontend
Resource    ../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
HOME-FE-001: Verificar layout da página inicial
    [Documentation]    Teste de verificar layout e responsividade
    [Tags]    layout_inicio    responsividade
    Feature Home UI
    Allure Test Info    Tesde de verificar o layout da página    Low

    Allure Step    Resetando o usuário no banco de dados para realizar o teste
    Reset user from database para teste

    Allure Step    Fazer login para realizar o teste
    Fazer Login com user criado para teste

    Allure Success    Layout da da página inicial correto.
    Allure Attach Screenshot    Evidência do layout
    Verificar layout da página de inicial

    Allure Success    Filmes em cartas na página inicial correto.
    Allure Attach Screenshot    Evidência dos filmes
    Verificar filmes em cartaz na página inicial

    Allure Success    Links úteis e menu de navegação correto.
    Allure Attach Screenshot    Evidência dos links e menu de navegação
    Verificar links úteis e menu de navegação da página inicial

    Allure Success    Responsividade da página inicial correto.
    Allure Attach Screenshot    Evidência da responsividade
    Verificar responsividade