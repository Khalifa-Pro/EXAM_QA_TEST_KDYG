*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation et de login
Resource          ../resources/open_login_logout.robot

*** Test Cases ***
Open Home Page And Log In and log out
    [Tags]    smoke    openloginlogout
    Login should succeed with valid credentials and log out

    Close Browser