*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${DOWNLOAD_PATH}    C:/Users/dougl/Downloads
${FILE_NAME}        sampleFile.jpeg 
${UPLOAD_NAME}        C:/Users/dougl/Desktop/Robot_Web/resources/imgs/princess.jpg
*** Keywords ***

Click on Upload and Download
    Click Element    xpath=(//*[@id="app"]/div/div/div//div/div/div[contains(., 'Elements')])[2]
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Upload and Download')]   timeout=10s
    Click Element    xpath=//*[contains(text(), 'Upload and Download')]

Click Download
    Click Element    id=downloadButton 

Click Upload
    Choose File  id=uploadFile  ${UPLOAD_NAME}

Check Upload
    Wait Until Element Is Visible    xpath=//*[contains(text(), ${UPLOAD_NAME})]   timeout=10s
    

Check if is Download
     Wait Until Keyword Succeeds    30x    2s    File Should Exist    ${DOWNLOAD_PATH}/${FILE_NAME}
    ${size} =    Get File Size    ${DOWNLOAD_PATH}/${FILE_NAME}
    Should Be True    ${size} > 0    File its correct
