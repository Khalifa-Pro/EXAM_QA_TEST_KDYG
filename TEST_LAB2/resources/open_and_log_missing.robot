*** Settings ***
Library           SeleniumLibrary
Variables         ../pageobject/variables.py
Variables         ../pageobject/locators.py

*** Keywords ***
Login should fail with missing credentials
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${CLICK_BUTTON_SIGNIN}    timeout=10s
    Wait Until Element Is Enabled    ${CLICK_BUTTON_SIGNIN}    timeout=10s
    Click Element    ${CLICK_BUTTON_SIGNIN}
    
    Wait Until Element Is Visible    ${LOGIN_INPUT}    timeout=10s
    Input Text    ${LOGIN_INPUT}    ${USERNAME_MISSING}
    Sleep    5s
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD_MISSING}
    
    Click Button    ${LOGIN_BUTTON}
    Sleep    5s
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    timeout=10s
    Sleep    5s
