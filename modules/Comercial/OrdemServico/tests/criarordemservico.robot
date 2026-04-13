*** Settings ***
Documentation     Criar uma ordem de serviço

Resource    ${CURDIR}/../resources/ordemservico.resource

*** Test Cases ***
Criar Ordem de Serviço
    [Documentation]   Teste para criar uma ordem de serviço
    Abrir Tela de Inclusão de OS