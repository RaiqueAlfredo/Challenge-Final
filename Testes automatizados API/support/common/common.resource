*** Settings ***
Documentation    Keywords para ações gerais

Resource    ../../support/base.robot

*** Keywords ***
Validar Status Code "${statuscode}"
    Log    Status Code: ${statuscode}