*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${NAME_ALERT}    Douglas
*** Keywords ***

Click on Alerts, Frame & Windows
    Click Element    xpath=(//*[@id="app"]/div/div/div//div/div/div[contains(., 'Alerts, Frame & Windows')])[2]
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Browser Windows')]   timeout=10s
    Click Element    xpath=//*[contains(text(), 'Alerts')]
    

Click in Basic allert
    Click Button    id=alertButton
    Alert Should Be Present    You clicked a button    timeout=2s

Click in Timer allert
    Click Button    id=timerAlertButton
    Alert Should not Be Present    You clicked a button    timeout=4s
    Alert Should Be Present    This alert appeared after 5 seconds    timeout=7s

Click in confirm allert
    Click Button    id=confirmButton
    Handle Alert    action=ACCEPT    timeout=5s  
    Wait Until Element Contains    xpath=//span[@id='confirmResult']   You selected Ok    timeout=5s
    
Click in cancell allert
    Click Button    id=confirmButton
    Handle Alert    action=DISMISS    timeout=5s
    Wait Until Element Contains    xpath=//span[@id='confirmResult']   You selected Cancel    timeout=5s  
    
Click in Prompt allert
    [Arguments]    ${NAME_ALERT}
    Click Button    id=promtButton
    Sleep    1s
    Input Text Into Alert    ${NAME_ALERT}
    Wait Until Element Contains    xpath=//span[@id='promptResult']   ${NAME_ALERT}    timeout=5s


    
    