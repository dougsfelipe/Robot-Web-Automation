*** Settings ***
Resource    ../../resources/page_objects/home_page.robot
Resource    ../../resources/page_objects/form_page.robot
Resource    ../../resources/page_objects/upload_download_page.robot

*** Test Cases ***
Add, Edit and Delete an User in Web Tables
    Acessar Página Inicial
    Clicar no elemento     Forms
    Page Should Contain    Forms
    Click on Web Tables
    Add an User   Douglas    Santos    dfcs@cin.ufpe    23    3000    TI
    Edit an User    Douglas    Maria
    Delete a User    Maria
    Acessar Página Inicial
    Clicar no elemento     Forms
    Page Should Contain    Forms
    Close Browser
   

Download and Upload an File
    Acessar Página Inicial
    Clicar no elemento     Forms
    Page Should Contain    Forms
    Click on Upload and Download
    Click Download
    Check if is Download
    Click Upload
    Check if is Download    
