*** Settings ***
Documentation        Cenários de visualizar usuários dentro do módulo de users
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session

*** Test Cases ***
AUTH-FE-004: Exibir informações do perfil
    [Tags]    ver_informacoes_perfil
    Reset user from database para teste
    Fazer Login com user criado para teste
    Abrir página de perfil
    Verificar informações do perfil