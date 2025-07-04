*** Settings ***
Documentation    Keywords customizadas para relatórios Allure mais bonitos - Frontend Tests

Resource    base.resource

*** Keywords ***
# Keywords para melhorar a visualização nos relatórios Allure
Allure Step
    [Arguments]    ${step_name}
    Log    📋 STEP: ${step_name}    level=INFO

Allure Attach Screenshot
    [Arguments]    ${screenshot_name}=Screenshot
    Take Screenshot    ${screenshot_name}
    Log    📷 SCREENSHOT: ${screenshot_name}    level=INFO

Allure Test Info
    [Arguments]    ${test_description}    ${severity}=normal
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

# Keywords para organizar testes por features - Frontend
Feature Authentication UI
    Log    🔐 FEATURE: Authentication UI Tests    level=INFO

Feature Movies UI
    Log    🎬 FEATURE: Movies UI Tests    level=INFO

Feature Reservations UI
    Log    🎫 FEATURE: Reservations UI Tests    level=INFO

Feature Sessions UI
    Log    📅 FEATURE: Sessions UI Tests    level=INFO

Feature Users UI
    Log    👤 FEATURE: Users UI Tests    level=INFO

Feature Home UI
    Log    🏠 FEATURE: Home UI Tests    level=INFO