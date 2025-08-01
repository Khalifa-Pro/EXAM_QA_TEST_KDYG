*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation et de login
Resource          ../resources/open_log_customers_grid.robot

*** Test Cases ***
Open Home Page And Log In
    [Tags]    smoke    openlogcustomersgrid
    Customers page should display multiple customers
    
    Close Browser