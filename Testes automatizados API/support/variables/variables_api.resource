*** Settings ***
Documentation    Arquivo para armazenar variáveis globais do Cinema App API

*** Variables ***
${ALIAS_BASE}    Cinema App API
${URL_BASE}    http://localhost:5000/api/v1
${auth_token_admin}    ${EMPTY}
&{headers}    accept=application/json  Content-Type=application/json