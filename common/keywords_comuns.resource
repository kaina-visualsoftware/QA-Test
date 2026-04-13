*** Settings ***
Documentation     Palavras-chave comuns para os testes de OS
Library           SikuliLibrary
Library           Process


*** Keywords ***
Avançar Campos
    [Arguments]    ${vezes}
    FOR    ${i}    IN RANGE    ${vezes}
        Press Key    TAB
        Sleep    1s
    END

Informar Valor
    [Arguments]    ${valor}
    Input Text     ${EMPTY}    ${valor}
    Sleep    0.5s

Pressionar Enter
    Press Special Key    ENTER
    Sleep    0.5s

Pressionar Atalho
    [Arguments]    ${atalho}
    Press Special Key    ${atalho}
    Sleep    1s

Inserir Produto
    [Arguments]    ${produto}
    Pressionar Atalho     F4
    Sleep    1s
    Informar Valor    ${produto}
    Pressionar Enter
    
