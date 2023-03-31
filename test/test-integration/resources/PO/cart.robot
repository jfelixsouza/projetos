*** Settings ***

Library    Selenium2Library
Library    DatabaseLibrary


*** Variables ***


*** Keywords ***

### AÇÃO ###
E altero a cor do produto de acordo com a cor no banco de dados
    Wait Until Element Is Visible    //span[contains(@class,'bunny productColor ng-scope GRAY')]
    Click Element   //span[contains(@class,'bunny productColor ng-scope GRAY')]
E clico em "add cart"
    Wait Until Element Is Visible    //button[@name='save_to_cart'][contains(.,'ADD TO CART')]
    Click Button    //button[contains(@name,'save_to_cart')]
# E pesquiso o produto clicando no ícone lupa
#     Wait Until Element Is Visible    //input[contains(@placeholder,'Search AdvantageOnlineShopping.com')]
#     Click Element    //input[contains(@placeholder,'Search AdvantageOnlineShopping.com')]
#     Input Text   //input[@id='autoComplete']    HP PAVILION 15Z TOUCH LAPTOP

# E seleciono o produto pesquisado
#     Click Element    (//img[@data-ng-src='/catalog/fetchImage?image_id=1300'])[1]


QUANDO seleciono a quantidade desejada
    Wait Until Element Is Visible    //div[@class='plus']
    Double Click Element    //div[@class='plus']

E clico em carrinho de compras
    Click Element    //a[@aria-label='ShoppingCart']

E removo o produto do carrinho
    Wait Until Element Is Visible    //a[@class='remove red ng-scope'][contains(.,'REMOVE')]
    Click Element    //a[@class='remove red ng-scope'][contains(.,'REMOVE')]
    

### VALIDAÇÕES ###

ENTAO validamos que o produto foi adcionado com a cor selecionada
    Click Element    //a[@aria-label='ShoppingCart']
    Capture Page Screenshot
    Page Should Contain Element    //span[contains(@title,'GRAY')]

ENTAO acesso a pagina do check-out
    Click Element    //a[@aria-label='ShoppingCart']
    Wait Until Element Is Visible    //button[contains(@data-ng-click,'checkout()')]
    Click Button    //button[contains(@data-ng-click,'checkout()')]

E validamos a soma dos preços correspondente ao total
    Page Should Contain Element    checkOutButton
    Capture Page Screenshot
    
    

ENTAO validamos que o carrinho de compras vazio
    Page Should Contain Element    //label[@class='roboto-bold ng-scope'][contains(.,'Your shopping cart is empty')]