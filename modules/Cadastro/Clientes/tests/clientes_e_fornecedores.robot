*** Settings ***
Documentation     Criar uma ordem de serviço

Resource    ${CURDIR}/../resources/clientesfornecedores.resource

*** Test Cases ***
Adicionar um Novo Cliente
    [Tags]    AdicionarCliente
    [Documentation]   Teste para adicionar um novo cliente/fornecedor
    Log    Iniciando teste: Adicionar um Novo Cliente/Fornecedor
    Abrir Tela de Cadastro de Clientes e Fornecedores
    