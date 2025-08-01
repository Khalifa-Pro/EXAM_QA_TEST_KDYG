*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation et de login
Resource          ../resources/open_and_log_missing.robot

*** Test Cases ***
Open Home Page And Log In
    [Tags]    smoke    openlogmissing
    Login should fail with missing credentials
    
    Close Browser