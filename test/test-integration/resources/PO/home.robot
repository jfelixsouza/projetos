*** Settings ***

Library    Selenium2Library



*** Variables ***

${HOME_URL}    https://advantageonlineshopping.com
${HOME_MENU}    //span[@class='roboto-medium ng-binding'][contains(.,'dvantage')]
${HOME_BTN_OFFER}    //button[@id='see_offer_btn'] 
${HOME_TITLE}     Advantage Shopping  



*** Keywords ***

### AÇÃO ###

DADO que acesso o home do site
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${HOME_MENU}
    Wait Until Element Is Visible    ${HOME_BTN_OFFER}    timeout=20
    Capture Page Screenshot


QUANDO clico no botão "See Offer"
    Wait Until Element Is Visible    //h3[@class='roboto-regular center ng-scope'][contains(.,'SPECIAL OFFER')]
    Click Element  ${HOME_BTN_OFFER}
    Capture Page Screenshot


E clico no botão "See Offer"
    Wait Until Element Is Visible    //h3[@class='roboto-regular center ng-scope'][contains(.,'SPECIAL OFFER')]
    Click Element  ${HOME_BTN_OFFER}
    Capture Page Screenshot