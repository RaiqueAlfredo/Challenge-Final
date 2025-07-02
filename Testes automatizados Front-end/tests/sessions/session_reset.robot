*** Settings ***
Documentation        Cenários de reset de assentos dentro do módulo de sessões
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session