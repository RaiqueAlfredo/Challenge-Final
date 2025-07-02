*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Users"

Resource        ../keywords/users_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
USER-BE-002: Obter detalhes de usuário por ID
    Login usuário admin
    Registrar usuário para o teste

USER-BE-003: Excluir usuário por ID
    Log    message