*** Settings ***
Documentation     Palavras-chave para os testes de OS

Library           SikuliLibrary
Resource          ${EXECDIR}/common/keywords_comuns.resource


*** Keywords ***
Carregar elementos da tela
    [Documentation]   Carrega os elementos da tela para serem utilizados nos testes
    Add Image Path    ${CURDIR}/../images

Abrir Ordem de Serviço
    [Documentation]   Abre a tela de Ordem de Serviço
    Pressionar Atalho     F3
    Sleep    1s

Abrir Tela de Inclusão de OS
    [Documentation]   Abre a tela de inclusão de OS
    Abrir Ordem de Serviço
    Carregar elementos da tela
    Wait Until Screen Contain    Adicionar.png    10
    Click     Adicionar.png