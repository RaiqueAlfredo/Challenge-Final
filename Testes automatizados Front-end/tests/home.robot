*** Settings ***
Documentation    Cenários de testes relacionados ao home do Cinema App Frontend
Resource    ../resources/base.resource

Test Setup    Start Session  
Test Teardown    Finalize Session

*** Test Cases ***
HOME-FE-001: Verificar layout da página inicial
    [Tags]    layout_inicio    responsividade
    Reset user from database para teste
    Fazer Login com user criado para teste
    Verificar layout da página de inicial
    Verificar filmes em cartaz na página inicial
    Verificar links úteis e menu de navegação da página inicial
    Verificar responsividade