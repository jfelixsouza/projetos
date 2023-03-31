*** Settings ***
Documentation    Teste NTTDATA
Resource    ../resources/PO/home.robot
Resource    ../resources/PO/cart.robot
Resource    ../resources/Resource.robot
Resource    ../resources/PO/databaseMassas.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador




*** Test Cases ***

Cenario 1 - Validar especificações do produto
    [Documentation]    Teste para validar pagina HOME e Menu Special Offer
    [Tags]             
    DADO que acesso o home do site
    QUANDO clico no botão "See Offer"
    ENTAO validamos as especificações do produto de acordo com o banco de dados


Cenario 2 - Validar alteração de cor do produto no carrinho
    [Documentation]    Teste para validar alteração da cor do produto
    [Tags]       
    DADO que acesso o home do site
    QUANDO clico no botão "See Offer"
    E altero a cor do produto de acordo com a cor no banco de dados
    E clico em "add cart"
    ENTAO validamos que o produto foi adcionado com a cor selecionada


Cenario 3 - Validar página de checkout
    [Documentation]    Teste para validar pagina check-out
    [Tags]       
    DADO que acesso o home do site    
    # E pesquiso o produto clicando no ícone lupa
    # E seleciono o produto pesquisado
    E clico no botão "See Offer"
    QUANDO seleciono a quantidade desejada
    E clico em "add cart"
    ENTAO acesso a pagina do check-out
    E validamos a soma dos preços correspondente ao total


Cenario 4 - Remover produto do carrinho de compras
    [Documentation]    Teste para validar carrinho vazio
    [Tags]       
    DADO que acesso o home do site
    QUANDO clico no botão "See Offer"
    E clico em "add cart"
    E clico em carrinho de compras
    E removo o produto do carrinho
    ENTAO validamos que o carrinho de compras vazio




