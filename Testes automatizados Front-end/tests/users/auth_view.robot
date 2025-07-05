*** Settings ***
Documentation        Cenários de visualizar usuários dentro do módulo de users
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session

*** Test Cases ***
AUTH-FE-004: Exibir informações do perfil
    [Documentation]    Teste de exibir informações do perfil
    [Tags]    ver_informacoes_perfil    usuario
    Feature Users UI
    Allure Test Info    Tesde de realizar logout pelo menu de navegação    Medium

    Allure Step    Resetar o usuário no banco de dados para realizar o teste
    Reset user from database para teste

    Allure Step    Fazer login para realizar o teste
    Fazer Login com user criado para teste

    Allure Step    Abrir página para realizar o teste
    Abrir página de perfil

    Allure Success    Informações do perfil exibidas corretamente.
    Allure Attach Screenshot    Evidência do sucesso
    Verificar informações do perfil