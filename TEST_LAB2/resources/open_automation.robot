*** Settings ***
Library           SeleniumLibrary
Variables         ../pageobject/variables.py
Variables         ../pageobject/locators.py

*** Keywords ***
Home page should load
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Sleep    2s
Close Browser
    Close Browser
