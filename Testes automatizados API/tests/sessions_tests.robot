*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Sessions"

Resource    ../keywords/sessions_keywords.resource
Resource    ../support/allure_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
SESSIONS-BE-003: Criar nova sessão
    [Documentation]    Teste de criar uma nova sessão
    [Tags]    criar_sessao_valido
    Feature Sessions
    Allure Test Info    Teste de criar sessão com dados válidos    High

    Allure Step    Executar login como admin para realizar o teste
    Login usuário admin

    Allure Step    Preparar o filme no banco de dados antes do teste
    Reset movie from database

    Allure Step    Preparar o cinema no banco de dados antes do teste
    Reset theater from database

    Allure Step    Preparar dados válidos para o teste
    Payload criar sessão com dados válidos

    Allure Step    Executar a criação de uma nova sessão
    POST endpoint /sessions

    Allure Step    Validar resposta de sucesso
    Allure Attach Response    ${resp.json()}
    Validar se criou uma nova sessão corretamente

    Allure Success    Uma nova sessão foi criada corretamente.
    Validar Status Code "201"
SESSIONS-BE-006: Criar sessão com payload inválido
    [Documentation]    Teste de criar uma sessão com dados inválidos
    [Tags]    criar_sessao_invalido
    Feature Sessions
    Allure Test Info    Teste de tentar criar uma sessão com dados inválidos    High

    Allure Step    Executar login como admin para executar o teste
    Login usuário admin

    Allure Step    Preparar dados inválidos para o teste
    Payload criar sessão com dados inválidos

    Allure Step    Executar a criação de uma nova sessão com dados inválidos
    POST endpoint /sessions com dados inválidos

    Allure Step    Validar resposta de erro
    Allure Attach Response    ${resp.json()}
    Validar se retornou mensagem de erro informando sobre os dados inválidos ao criar a sessão

    Allure Success    API rejeitou corretamente a ação de criar uma sessão com dados inválidos.
    Validar Status Code "404"