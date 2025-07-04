*** Settings ***
Documentation    Keywords customizadas para relatórios Allure mais bonitos

*** Keywords ***
# Keywords para melhorar a visualização nos relatórios Allure
Allure Step
    [Arguments]    ${step_name}
    Log    📋 STEP: ${step_name}    level=INFO

Allure Attach Response
    [Arguments]    ${response_data}
    Log    📄 RESPONSE: ${response_data}    level=INFO

Allure Test Info
    [Arguments]    ${test_description}    ${severity}
    Log    ℹ️ TEST INFO: ${test_description}    level=INFO
    Log    🎯 SEVERITY: ${severity}    level=INFO

Allure Success
    [Arguments]    ${message}
    Log    ✅ SUCCESS: ${message}    level=INFO

Allure Error
    [Arguments]    ${message}
    Log    ❌ ERROR: ${message}    level=ERROR

Allure Warning
    [Arguments]    ${message}
    Log    ⚠️ WARNING: ${message}    level=WARN

# Keywords para organizar testes por features
Feature Authentication
    Log    🔐 FEATURE: Authentication Tests    level=INFO

Feature Movies
    Log    🎬 FEATURE: Movies Tests    level=INFO

Feature Reservations
    Log    🎫 FEATURE: Reservations Tests    level=INFO

Feature Sessions
    Log    📅 FEATURE: Sessions Tests    level=INFO

Feature Theaters
    Log    🏛️ FEATURE: Theaters Tests    level=INFO

Feature Users
    Log    👤 FEATURE: Users Tests    level=INFO