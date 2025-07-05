*** Settings ***
Documentation        Cenários de atualizar usuários dentro do módulo de users
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session

*** Test Cases ***
AUTH-FE-005: Editar e salvar alterações no perfil
    [Documentation]    Teste de editar e salvar alterações no perfil
    [Tags]    editar_perfil    usuario
    Feature Users UI
    Allure Test Info    Teste de editar e salvar alterações no perfil    Low

    Allure Step    Resetando usuário no banco de dados para realizar o teste
    Reset user from database para teste

    Allure Step    Preparando dados válidos para o teste
    ${user}    Create Dictionary    name=Usuario Test Put

    Allure Step    Fazer login para realizar o teste
    Fazer Login com user criado para teste

    Allure Step    Abrir página de perfil para efetuar as ações    
    Abrir página de perfil
    
    Allure Step    Realizando a atualização de perfil e salvando
    Atualizar nome de perfil e salvar alterações    ${user}

    Allure Success    Informações salvas corretamente.
    Allure Attach Screenshot    Perfil atualizado
    Verificar se salvou as alterações
AUTH-FE-008: Atualizar perfil com informações inválidas pela interface
    [Documentation]    Teste de atualizar perfil com informações inválidas
    [Tags]    editar_perfil_com_infos_invalidas    usuario
    Feature Users UI
    Allure Test Info    Teste de editar perfil com informações inválidas   Low
    
    Allure Step    Fazer login pra realizar o teste
    Fazer Login user comum

    Allure Step    Abrir página de perfil para realizar o teste
    Abrir página de perfil
    
    Allure Step    Preparando dados válidos para o teste
    ${data}    Get Fixture    auth    user

    Allure Step    $step_name
    Atualizar nome de perfil e salvar alterações    ${data}[user_invalido]

    Allure Success    Pede para preencher os campos.
    Allure Attach Screenshot    Evidência do teste
    Validar se informa para preencher os campos