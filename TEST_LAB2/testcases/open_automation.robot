*** Settings ***
Documentation     Scénarios de test d'ouverture d'automatisation
Resource          ../resources/open_automation.robot

*** Test Cases ***
Cas1-Ouvrir la page d'accueil
    [Tags]    smoke    open
    Home page should load
    Close Browser