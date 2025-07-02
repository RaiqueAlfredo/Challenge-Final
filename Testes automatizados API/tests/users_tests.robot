*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Users"

Resource        ../keywords/users_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
USER-BE-002: Obter detalhes de usuário por ID
    [Tags]    obter_detalhes_user_por_id
    Reset user from database
    Login usuário admin
    GET endpoint /users/id-user
    Validar se retornou os detalhes do usuário corretamente
    Validar Status Code "200"
USER-BE-003: Excluir usuário por ID
    [Tags]    excluir_user_por_id
    Reset user from database
    Login usuário admin
    DELETE endpoin /users/id-user
    Validar se usuário foi removido com sucesso
    Validar Status Code "200"