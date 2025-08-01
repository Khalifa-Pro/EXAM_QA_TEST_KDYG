*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation et de login
Resource          ../resources/open_and_log.robot

*** Test Cases ***
Open Home Page And Log In
    [Tags]    smoke    openlog
    Login should succeed with valid credentials
    
    Close Browser