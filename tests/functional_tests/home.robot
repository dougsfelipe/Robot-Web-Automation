*** Settings ***
Resource    ../../resources/page_objects/home_page.robot
Resource    ../../resources/page_objects/form_page.robot

*** Test Cases ***
Teste de Navegação para Elements
    Acessar Página Inicial
    Clicar no elemento     Forms
    Page Should Contain    Forms
   

Teste de add
    Click on Web Tables
    Add an User   Douglas    Santos    dfcs@cin.ufpe    23    3000    TI

Test edit an userEmail
    Edit an User    Douglas    Maria

Test delet an user 
    Delete a User    Maria