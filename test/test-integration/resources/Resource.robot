*** Settings ***

Library    Selenium2Library


*** Variables ***
${BROWSER}    chrome    

*** Keywords ***

### Setup e Teardwon

Abrir navegador
    Open Browser     browser=${BROWSER}
Fechar navegador
    Close Browser    

