*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation et de login
Resource          ../resources/open_log_add_customers.robot

*** Test Cases ***
Open Home Page And Log In
    [Tags]    smoke    openlogaddcustomers
    Should be able to add new customer
    
    Close Browser