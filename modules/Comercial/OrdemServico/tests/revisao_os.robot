*** Settings ***
Documentation     Criar uma ordem de serviço

Resource    ${CURDIR}/../resources/ordemservico.resource

Test Teardown    Fechar Tela de OS

*** Test Cases ***
1-579 - Selecionar cliente na venda com CPF existente no cadastro
    [Tags]    1-579
    [Setup]    Verificar e Configurar Banco    6513
    [Documentation]   Teste para criar uma ordem de serviço
    Log    Iniciando teste: 1-579 - Selecionar cliente na venda com CPF existente no cadastro
    Abrir Tela de Inclusão de OS
    Se: Tela de Indicacao Existir Então Fechar
    Adicionar Vendedor    2
    Adicionar Cliente    05402266964
    Se: Tela de Creditos Existir Então Fechar
    Log    Teste 1-579 concluído com sucesso

1-579 - Selecionar cliente na venda com CPF inexistente no cadastro
    [Tags]    1-579
    [Setup]    Verificar e Configurar Banco    6513
    [Documentation]   Teste para criar uma ordem de serviço
    Log    Iniciando teste: 1-579 - Selecionar cliente na venda com CPF existente no cadastro
    Abrir Tela de Inclusão de OS
    Se: Tela de Indicacao Existir Então Fechar
    Adicionar Vendedor    2
    Adicionar Cliente    65011982246
    Se: Tela de Aviso Sem CPF Cadastrado Existir Então Fechar
    Log    Teste 1-579 concluído com sucesso