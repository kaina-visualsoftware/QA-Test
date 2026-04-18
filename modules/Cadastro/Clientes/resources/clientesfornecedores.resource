*** Settings ***
Documentation     Palavras-chave para os testes de OS

Library           SikuliLibrary
Library           Process
Library           ImageHorizonLibrary
Resource          ${EXECDIR}/common/keywords_comuns.resource


*** Keywords ***
Abrir Tela de Listagem de Clientes e Fornecedores
    [Documentation]   Abre a tela de lista de Clientes e Fornecedores
    Pressionar Atalho    F5
    Wait Until Screen Contain    FrmClientesFornecedores.png    20
    Log    Tela de listagem de Clientes e Fornecedores aberta
    Sleep    1s

Abrir Tela de Cadastro de Clientes e Fornecedores
    [Documentation]   Abre a tela de inclusão de Ordem de Serviço
    Abrir Tela de Listagem de Clientes e Fornecedores
    Avançar Campos    2
    Pressionar Enter
    Wait Until Screen Contain    FrmClientesFornecedoresCadastro.png    20
    Log    Tela de inclusão de Clientes e Fornecedores aberta
    Sleep    1s

Adicionar Dados Basicos do Cliente
    [Arguments]   ${razao_social}=Teste    ${nome_fantasia}=Teste    ${cpf_cnpj}
    [Documentation]   Preenche os dados básicos do cliente na tela de inclusão de Clientes e Fornecedores
    
    
    
Adicionar Endereco do Cliente
    [Arguments]   ${cep}=00000000    ${logradouro}=Teste    ${numero}=123    ${bairro}=Teste    ${cidade}=Teste    ${estado}=SP
    [Documentation]   Preenche os dados de endereço do cliente na tela de inclusão de Clientes e Fornecedores