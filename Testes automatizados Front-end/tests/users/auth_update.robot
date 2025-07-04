*** Settings ***
Documentation        Cenários de atualizar usuários dentro do módulo de users
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session

*** Test Cases ***
AUTH-FE-005: Editar e salvar alterações no perfil
    [Tags]    editar_perfil    usuario
    Reset user from database para teste
    ${user}    Create Dictionary    name=Usuario Test Put
    Fazer Login com user criado para teste
    Abrir página de perfil
    Atualizar nome de perfil e salvar alterações    ${user}
    Verificar se salvou as alterações
AUTH-FE-008: Atualizar perfil com informações inválidas pela interface
    [Tags]    editar_perfil_com_infos_invalidas    usuario
    Fazer Login user comum
    Abrir página de perfil
    ${data}    Get Fixture    auth    user
    Atualizar nome de perfil e salvar alterações    ${data}[user_invalido]
    Validar se informa para preencher os campos