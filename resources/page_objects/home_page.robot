*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://demoqa.com/

*** Keywords ***
Acessar Página Inicial
    Open Browser    ${URL}    chrome 

Clicar no elemento
    [Arguments]    ${texto}
    ${seletor}    Set Variable    xpath=//h5[text()='${texto}']
    Wait Until Element Is Visible    ${seletor}    timeout=10s
    Click Element    ${seletor}

