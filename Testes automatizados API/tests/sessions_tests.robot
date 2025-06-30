*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Sessions"
Resource        ../keywords/sessions_keywords.resource

*** Test Cases ***
SESSIONS-BE-003: Criar nova sessão
    Log    a

SESSIONS-BE-006: Criar sessão com payload inválido
    Log    message