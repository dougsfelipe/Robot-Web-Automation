*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    DateTime

*** Variables ***
${NAME_ALERT}    Douglas
*** Keywords ***

Click on Date Picker
    Click Element    xpath=(//*[@id="app"]/div/div/div//div/div/div[contains(., 'Date Picker')])[2]
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Date Picker')]   timeout=10s
    Click Element    xpath=//*[contains(text(), 'Date Picker')]
Pick Date
    ${Yesterday_DateTime} =    Get Current Date    result_format=%d/%m/%Y    increment=-1 day
    Click Element    id=datePickerMonthYearInput
    Sleep    1s
    Press Keys    id=datePickerMonthYearInput    CTRL+a    BACKSPACE
    Sleep    1s
    Input Text    id=datePickerMonthYearInput    ${Yesterday_DateTime}
    ${Inserted_DateTime} =    Get Value    id=datePickerMonthYearInput
    Should Be Equal    ${Inserted_DateTime}    ${Yesterday_DateTime}    msg=Erro: A data no Date Picker está incorreta!


Pick Date and time
    Press Keys    NONE    ESC
    ${Yesterday_DateTime} =    Get Current Date    result_format=%d/%m/%Y %H:%M    increment=-1 day
    Click Element    id=dateAndTimePickerInput
    Sleep    1s
    Press Keys    id=dateAndTimePickerInput    CTRL+a    BACKSPACE
    Sleep    1s
    Input Text    id=dateAndTimePickerInput    ${Yesterday_DateTime}
    ${Inserted_Date} =    Get Value    id=dateAndTimePickerInput
    Should Be Equal    ${Inserted_Date}    ${Yesterday_DateTime}    msg=Erro: A data no Date Picker está incorreta!

