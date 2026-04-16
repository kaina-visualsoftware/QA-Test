*** Settings ***
Documentation     Palavras-chave comuns para os testes de OS
Library           SikuliLibrary
Library           ImageHorizonLibrary
Library           Process

*** Variables ***
${MYCOMMERCE_PATH}      C:\\Visual Software\\MyCommerce\\myCommerce.exe
${MYCOMMERCE_IMAGE}     mycommerce.png
${BANCO_ATUAL}          6513

*** Keywords ***
Abrir MyCommerce
    [Arguments]    ${caminho}=${MYCOMMERCE_PATH}
    [Documentation]    Abre o aplicativo MyCommerce usando o Executar do Windows
    Pressionar Combinacao Teclas    Key.WIN    Key.r
    Sleep    1s
    Informar Valor    ${caminho}
    Pressionar Enter
    Carregar elementos da tela
    Wait Until Screen Contain    ${MYCOMMERCE_IMAGE}    15

Deslogar e Fechar MyCommerce
    [Documentation]    Encerra o MyCommerce quando é necessário trocar de banco
    Pressionar Combinacao Teclas    Key.CTRL    Key.l
    Sleep    2s
    Pressionar Combinacao Teclas    Key.ALT    Key.F4
    Sleep    3s

Preencher Empresa
    [Arguments]    ${empresa}=1    ${preencher}=TRUE
    [Documentation]    Preenche o código da empresa na tela de login somente quando necessário
    Run Keyword If    '${preencher}' == 'TRUE'    Informar Valor    ${empresa}
    ...    ELSE    No Operation
    Run Keyword If    '${preencher}' == 'TRUE'    Pressionar Enter

Logar
    [Arguments]    ${usuario}=KAINA    ${senha}=d9o67@rD8    ${preencher_empresa}=TRUE
    [Documentation]    Realiza o login no MyCommerce
    Carregar elementos da tela
    Wait Until Screen Contain    ${MYCOMMERCE_IMAGE}    15
    Preencher Empresa    1    ${preencher_empresa}
    Sleep    1s
    Pressionar Combinacao Teclas    Key.CTRL    Key.F12
    Informar Valor    ${usuario}
    Pressionar Enter
    Informar Valor    ${senha}
    Pressionar Enter

Configurar Banco de Dados
    [Arguments]    ${banco_dados}
    [Documentation]    Altera o banco de dados no MyCommerce
    Pressionar Combinacao Teclas    Key.CTRL    Key.F5
    Sleep    1s
    Avançar Campos    4
    Informar Valor    ${banco_dados}
    Carregar elementos da tela
    SikuliLibrary.Click    gravarmyc.png
    Sleep    1s

Reiniciar MyCommerce Com Banco
    [Arguments]    ${banco}    ${preencher_empresa}=TRUE    ${usuario}=KAINA    ${senha}=d9o67@rD8
    [Documentation]    Reinicia o MyCommerce e configura o banco informado
    Deslogar e Fechar MyCommerce
    Abrir MyCommerce
    Configurar Banco de Dados    ${banco}
    Logar    ${usuario}    ${senha}    ${preencher_empresa}
    Set Global Variable    ${BANCO_ATUAL}    ${banco}

Abrir MyCommerce e Logar
    [Arguments]    ${banco}=6513    ${preencher_empresa}=TRUE    ${usuario}=KAINA    ${senha}=d9o67@rD8
    [Documentation]    Abre o MyCommerce, configura o banco e realiza o login
    Abrir MyCommerce
    Configurar Banco de Dados    ${banco}
    Logar    ${usuario}    ${senha}    ${preencher_empresa}
    Set Global Variable    ${BANCO_ATUAL}    ${banco}
    Sleep    1s

Verificar e Configurar Banco
    [Arguments]    ${novo_banco}    ${preencher_empresa}=TRUE
    [Documentation]    Verifica se o banco mudou e reinicia o MyCommerce só quando necessário
    IF    '${BANCO_ATUAL}' == '${EMPTY}'
        Abrir MyCommerce e Logar    ${novo_banco}    ${preencher_empresa}
    ELSE IF    '${BANCO_ATUAL}' != '${novo_banco}'
        Reiniciar MyCommerce Com Banco    ${novo_banco}    ${preencher_empresa}
    ELSE
        Log    Banco atual é ${BANCO_ATUAL}, não é necessário reiniciar.    INFO
    END

Avançar Campos
    [Arguments]    ${vezes}=1
    FOR    ${i}    IN RANGE    ${vezes}
        Press Special Key    TAB
        Sleep    1s
    END

Informar Valor
    [Arguments]    ${valor}
    Input Text     ${EMPTY}    ${valor}
    Sleep    1s

Pressionar Enter
    Press Special Key    ENTER
    Sleep    1s

Pressionar Atalho
    [Arguments]    ${atalho}
    Press Special Key    ${atalho}
    Sleep    1s

Pressionar Combinacao Teclas
    [Arguments]    @{teclas}
    [Documentation]    Pressiona uma combinação de teclas usando ImageHorizonLibrary.
    ...    Use apenas teclas no formato Key.X, por exemplo Key.WIN Key.r.
    Press Combination    @{teclas}
    Sleep    1s

Pressionar Atalho com Modificador
    [Arguments]    ${atalho}   ${modificador}=${EMPTY}
    Run Keyword If    '${modificador}' == '${EMPTY}'    Press Special Key    ${atalho}
    ...    ELSE   Type With Keys Down    ${atalho}    ${modificador}
    Sleep    1s

Usar as setas
    [Arguments]     ${SETA}
    Press Special Key    ${SETA}
    Sleep    1s

Carregar elementos da tela
    [Documentation]   Carrega os elementos da tela para serem utilizados nos testes
    Add Image Path    ${CURDIR}/../images

Se: Tela de Creditos Existir Então Fechar
    [Documentation]   Fecha a tela de créditos se ela existir
    Carregar elementos da tela
    ${creditos}=    Run Keyword And Return Status    Wait Until Screen Contain    FrmCreditos.png    10
    IF    ${creditos}
        Pressionar Atalho    ESC
    END
    Sleep    1s

Se: Tela de Aviso Sem CPF Cadastrado Existir Então Fechar
    [Documentation]   Fecha a tela de aviso de CPF não cadastrado se ela existir
    Carregar elementos da tela
    ${aviso}=    Run Keyword And Return Status    Wait Until Screen Contain    FrmAvisoSemCPFCadastrado.png    10
    IF    ${aviso}
        Pressionar Atalho    ESC
    END
    Sleep    1s

Se: Tela de Aviso de Cancelamento de OS Existir Então Fechar
    [Documentation]   Fecha a tela de aviso de cancelamento de OS se ela existir
    Carregar elementos da tela
    ${aviso_cancelamento}=    Run Keyword And Return Status    Wait Until Screen Contain    FrmAvisoCancelamentoOS.png    10
    IF    ${aviso_cancelamento}
        Pressionar Enter
    END
    Sleep    1s

Se: Tela de Senha de Supervisor para Cancelamento de OS Existir Então Fechar
    [Arguments]    ${senha_supervisor}=1
    [Documentation]   Fecha a tela de senha de supervisor para cancelamento de OS se ela existir
    Carregar elementos da tela
    ${tela_existe}=    Run Keyword And Return Status    Wait Until Screen Contain    FrmSenhaSupervisorCancelamentoOS.png    10
    IF    ${tela_existe}
        Informar Valor    ${senha_supervisor}
        Avançar Campos
        Pressionar Enter
    END
    Sleep    1s

Adicionar Vendedor
    [Arguments]    ${vendedor}=1
    [Documentation]   Preenche o vendedor na ordem de serviço
    Informar Valor    ${vendedor}
    Avançar Campos    1
    Usar as setas    DOWN
    Avançar Campos    1
    Log    Vendedor adicionado
    Sleep    1s

Adicionar Cliente
    [Arguments]    ${cliente}=1
    [Documentation]   Preenche o cliente na ordem de serviço
    Informar Valor    ${cliente}
    Pressionar Enter
    Log    Cliente adicionado
    Sleep    1s