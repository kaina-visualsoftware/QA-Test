*** Settings ***
Documentation     Palavras-chave para os testes de OS

Library           SikuliLibrary
Library           Process
Library           ImageHorizonLibrary
Resource          ${EXECDIR}/common/keywords_comuns.resource


*** Keywords ***
Abrir Tela de Listagem de OS
    [Documentation]   Abre a tela de lista de Ordens de Serviço
    Carregar elementos da tela
    Pressionar Atalho    F3
    Sleep    1s
    Log    Tela de listagem de OS aberta

Abrir Tela de Inclusão de OS
    [Documentation]   Abre a tela de inclusão de Ordem de Serviço
    Abrir Tela de Listagem de OS
    Avançar Campos    2
    Pressionar Enter
    Sleep    1s
    Log    Tela de inclusão de OS aberta

Se: Tela de Indicacao Existir Então Fechar
    [Documentation]   Fecha a indicação se ela existir
    Carregar elementos da tela
    ${indicacao}=    Run Keyword And Return Status    Wait Until Screen Contain    FrmIndicacao.png    10
    IF    ${indicacao}
        Pressionar Atalho    ESC
    END
    Sleep    1s


Fechar Tela de OS
    [Documentation]   Fecha a tela de OS
    Pressionar Atalho    ESC
    Se: Tela de Aviso de Cancelamento de OS Existir Então Fechar
    Se: Tela de Senha de Supervisor para Cancelamento de OS Existir Então Fechar
    Pressionar Atalho    ESC
    Sleep    1s