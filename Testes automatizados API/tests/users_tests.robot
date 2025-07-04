*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Users"

Resource    ../keywords/users_keywords.resource
Resource    ../support/allure_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
USER-BE-002: Obter detalhes de usuário por ID
    [Documentation]    Teste de obter detalhes do usuário por ID
    [Tags]    obter_detalhes_user_por_id
    Feature Users
    Allure Test Info    Teste de obter detalhes do usuário por ID    High

    Allure Step    Preparando o usuário no banco de dados antes do teste
    Reset user from database

    Allure Step    Executar login como admin para realizar o teste
    Login usuário admin

    Allure Step    Executar a ação de obter detalhes do usuário por ID
    GET endpoint /users/id-user

    Allure Step    Validar resposta de sucesso
    Allure Attach Response    ${resp.json()}
    Validar se retornou os detalhes do usuário corretamente

    Allure Success    Detalhes de usuário por ID obtidos com sucesso.
    Validar Status Code "200"
USER-BE-003: Excluir usuário por ID
    [Documentation]    Teste de excluir usuário por ID
    [Tags]    excluir_user_por_id
    Feature Users
    Allure Test Info    Teste de excluir usuário por ID    High

    Allure Step    Preparando o usuário no banco de dados antes do teste
    Reset user from database

    Allure Step    Executar login como admin para realizar o teste
    Login usuário admin

    Allure Step    Executar a exclusão de usuário por ID
    DELETE endpoin /users/id-user

    Allure Step    Validar resposta de sucesso
    Allure Attach Response    ${resp.json()}
    Validar se usuário foi removido com sucesso

    Allure Success    Usuário excluído com sucesso.
    Validar Status Code "200"