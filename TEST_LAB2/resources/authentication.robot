*** Settings ***
Library           SeleniumLibrary
Variables         ../pageobject/variables.py
Variables         ../pageobject/locators.py

*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Sleep    2s

Click Sign In Button
    Click Element    ${CLICK_BUTTON_SIGNIN}
    Wait Until Element Is Visible    ${LOGIN_INPUT}    timeout=10s

Input Credentials
    Input Text    ${LOGIN_INPUT}    ${USERNAME}
    Sleep    2s
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Sleep    2s

Submit Login Form
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    timeout=10s

Close Browser
    Close Browser
