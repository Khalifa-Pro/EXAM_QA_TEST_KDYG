*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation et de login
Resource          ../resources/open_log_add_customer_cancel.robot

*** Test Cases ***
Open Home Page And Log In
    [Tags]    smoke    openlogaddcustomerscancel
    Should be able to cancel adding new customer
    
    Close Browser