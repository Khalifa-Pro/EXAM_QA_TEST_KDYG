*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation et de login
Resource          ../resources/open_and_log_remember_me.robot

*** Test Cases ***
Open Home Page And Log In
    [Tags]    smoke    openlogrememberme
    Remember me checkbox should persist email address
    
    Close Browser