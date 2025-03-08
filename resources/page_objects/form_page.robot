*** Settings ***
Library    SeleniumLibrary
Library    Telnet

*** Variables ***
${URL}    https://demoqa.com
${FIRST_NAME}      Douglas
${LAST_NAME}       Santos
${EMAIL}           dfcs@cin.ufpe
${AGE}             23
${SALARY}          3000
${DEPARTMENT}      TI

*** Keywords ***

Click on Web Tables
    Click Element    xpath=(//*[@id="app"]/div/div/div//div/div/div[contains(., 'Elements')])[2]
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Web Tables')]   timeout=10s
    Click Element    xpath=//*[contains(text(), 'Web Tables')]

Add an User
    [Arguments]    ${first}    ${last}    ${email}    ${age}    ${salary}    ${dept}

    Click Button    id=addNewRecordButton
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Registration Form')]   timeout=10s
    Input Text    id=firstName    ${first}
    Input Text    id=lastName    ${last}
    Input Text    id=userEmail    ${email}
    Input Text    id=age    ${age}
    Input Text    id=salary    ${salary}
    Input Text    id=department    ${dept}
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//*[contains(text(), ${first})]   timeout=10s


Edit an User
    [Arguments]    ${first}    ${newNane}  
    Wait Until Element Is Visible    id=edit-record-4  timeout=10s
    Execute JavaScript    document.getElementById('edit-record-4').click()  
    Input Text    id=firstName    ${newNane}
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//*[contains(text(),${newNane})]   timeout=10s
    Sleep    10s

Delete a User
    [Arguments]    ${first} 
    Wait Until Element Is Visible    id=delete-record-4  timeout=10s
    Execute JavaScript    document.getElementById('delete-record-4').click()  
    Wait Until Element Is Not Visible  xpath=//*[contains(text(),'Maria')]  timeout=20s





     



