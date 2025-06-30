*** Settings ***
Documentation    Cenários de testes candidatos à automação para o módulo de "Authentication"
Resource        ../keywords/authentication_keywords.resource

*** Test Cases ***
AUTH-BE-002: Login de usuário
    Log    a

AUTH-BE-006: Registro com e-mail já existente
    Log    message

AUTH-BE-007: Login com credenciais inválidas
    Log    message