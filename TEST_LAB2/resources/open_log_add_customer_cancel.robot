*** Settings ***
Library           SeleniumLibrary
Variables         ../pageobject/variables.py
Variables         ../pageobject/locators.py

*** Keywords ***
Should be able to cancel adding new customer
    [Documentation]    Fonctionnalité de test pour vérifier l'annulation de l'ajout d'un nouveau client

    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    ${CLICK_BUTTON_SIGNIN}    timeout=10s
    Click Element    ${CLICK_BUTTON_SIGNIN}

    Wait Until Element Is Visible    ${LOGIN_INPUT}    timeout=10s
    Input Text    ${LOGIN_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${ADD_NEW_CUSTOMER}    timeout=10s
    Click Element    ${ADD_NEW_CUSTOMER}
    
    Sleep    2s
    Click Element   ${CANCEL_NEW_CUSTOMER}
    Wait Until Page Contains    ${ADD_NEW_CUSTOMER}    timeout=5s

close browser
    Close Browser
