*** Settings ***

Library    Selenium2Library
Library    DatabaseLibrary
Library    String


*** Keywords ***

Conectar Banco de dados
    Connect To Database    dbapiModuleName=pymysql    dbName=banco_teste_automacao    dbUsername=root    dbPassword=EL6529jo1010&    dbHost=localhost    dbPort=3306


Desconectar Banco de dados
    Disconnect From Database

ENTAO validamos as especificações do produto de acordo com o banco de dados
    Connect To Database    dbapiModuleName=pymysql    dbName=banco_teste_automacao    dbUsername=root    dbPassword=EL6529jo1010&    dbHost=localhost    dbPort=3306

    ${RESPOSTA_SELECT}     Query    Select * from massas
    Log Many    ${RESPOSTA_SELECT}

    Check If Exists In Database    select * from massas where IDMASSAS=1 and NAME_PRODUCT='HP PAVILION 15Z TOUCH LAPTOP'

    ${RESPOSTA_SELECT_CUSTOMIZATION}    Query    select distinct CUSTOMIZATION from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_DISPLAY}        Query    select distinct DISPLAY from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_DISPLAY_RESOLUTION}        Query    select distinct DISPLAY_RESOLUTION from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_DISPLAY_SIZE}        Query    select distinct DISPLAY_SIZE from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_MEMORY}        Query    select distinct MEMORY from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_OPERATING_SYSTEM}        Query    select distinct OPERATING_SYSTEM from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_PROCESSOR}        Query    select distinct PROCESSOR from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_TOUCHSCREEN}        Query    select distinct TOUCHSCREEN from massas where IDMASSAS=1
    ${RESPOSTA_SELECT_WEIGHT}        Query    select distinct WEIGHT from massas where IDMASSAS=1

  

    Should Be Equal As Strings    ${RESPOSTA_SELECT_CUSTOMIZATION}    (('Simplicity',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_DISPLAY}    (('15.6-inch diagonal Full HD WLED-backlit Display (1920x1080) Touchscreen',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_DISPLAY_RESOLUTION}    (('1920x1080',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_DISPLAY_SIZE}    (('15.6',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_MEMORY}    (('16GB DDR3 - 2 DIMM',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_OPERATING_SYSTEM}    (('Windows 10',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_PROCESSOR}    (('AMD Quad-Core A10-8700P Processor + AMD Radeon(TM) R6 Graphics',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_TOUCHSCREEN}    (('Yes',),)
    Should Be Equal As Strings    ${RESPOSTA_SELECT_WEIGHT}    (('5.51 lb',),)


    Disconnect From Database

