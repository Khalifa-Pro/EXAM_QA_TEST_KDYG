*** Settings ***
Library           SeleniumLibrary
Variables         ../pageobject/variables.py
Variables         ../pageobject/locators.py

*** Keywords ***
Customers page should display multiple customers
    [Documentation]    Effectue une connexion avec des identifiants valides et se déconnecte

    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    ${CLICK_BUTTON_SIGNIN}    timeout=10s
    Wait Until Element Is Enabled    ${CLICK_BUTTON_SIGNIN}    timeout=10s
    Click Element    ${CLICK_BUTTON_SIGNIN}

    Wait Until Element Is Visible    ${LOGIN_INPUT}    timeout=10s
    Input Text    ${LOGIN_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${ADD_NEW_CUSTOMER}    timeout=10s
    Sleep    1s

    Click Element    xpath=//ul[@class="pagination"]/li/a[text()="2"]
    Sleep    3s
    Click Element    xpath=//ul[@class="pagination"]/li/a[text()="3"]
    Sleep    3s
    Click Element    xpath=//ul[@class="pagination"]/li/a[text()="Previous"]
    Sleep    3s
    Click Element    xpath=//ul[@class="pagination"]/li/a[text()="Next"]
    Sleep    3s
    Wait Until Page Contains    Sign In    timeout=5s


close browser
    Close Browser
