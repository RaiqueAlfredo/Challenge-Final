*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Reservations"

Resource    ../keywords/reservations_keywords.resource
Resource    ../support/allure_keywords.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
RESERVATIONS-BE-004: Criar nova reserva
    [Documentation]    Teste de criar uma nova reserva
    [Tags]    criar_reserva_valida
    Feature Reservations
    Allure Test Info    Teste de criar uma nova reserva válida    High

    Allure Step    Preparar a sessão no banco de dados antes do teste
    Reset session from database

    Allure Step    Resetar os assentos da sessão antes do teste
    Deixar os assentos da sessão disponível para o teste

    Allure Step    Executar login para realizar o teste
    Login usuário comum

    Allure Step    Preparar dados válidos para o teste
    Payload criar reserva com dados válidos

    Allure Step    Executar a criação de uma nova reserva
    POST endpoint /reservations

    Allure Step    Validar resposta de sucesso
    Allure Attach Response    ${resp.json()}
    Validar se a reserva foi criada corretamente

    Allure Success   Reserva criada com sucesso.
    Validar Status Code "201"
RESERVATIONS-BE-007: Tentar obter reservas sem autenticação
    [Documentation]    Teste de tentar obter reservas sem autenticação
    [Tags]    obter_reserva_sem_auth
    Feature Reservations
    Allure Test Info    Teste de obter reservas sem autenticação    High

    Allure Step    Fazer login para realizar o teste
    Login usuário comum

    Allure Step    Executar a ação de obter reservas, mas sem passar o token do login
    GET endpoint /reservations/me sem autenticação

    Allure Step    Validar resposta de erro
    Allure Attach Response    ${resp.json()}
    Validar se retornou mensagem de erro informando a necessidade de autenticação

    Allure Success    API rejeitou corretamente a ação de obter reservas sem autenticação.
    Validar Status Code "401"
RESERVATIONS-BE-009: Criar reserva com payload inválido
    [Documentation]    Teste de criar reserva com payload inválido
    [Tags]    criar_reserva_inv    bug_conhecido
    Feature Reservations
    Allure Test Info    Teste de tentar criar uma reserva com payload inválido   High

    Allure Step    Executar login antes de realizar o teste
    Login usuário comum

    Allure Step    Preparar dados inválidos para o teste
    Payload criar reserva com dados inválidos

    Allure Step    Executar criação de reserva com dados inválidos
    POST endpoint /reservations com payload inválido

    Allure Success   Status code retorna o esperado
    Validar Status Code "400"

    Allure Error    API não lida corretamente com IDs inválidos ou inexistentes.
    Allure Attach Response    ${resp.json()}
    Validar se retornar mensagem de erro indicando os problemas no payload