*** Settings ***
Documentation        Cenários de visualizar sessões dentro do módulo de sessões
Resource             ../../resources/base.resource

Test Setup           Start Session  
Test Teardown        Finalize Session