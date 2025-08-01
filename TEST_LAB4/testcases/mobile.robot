*** Settings ***
Library           AppiumLibrary

Variables        ../po/variables.py
Resource         ../resources/common.robot


Suite Setup    Run Keyword    Open Application MyApp


*** Test Cases ***
Open Application and Login
    [Tags]     "init"
    Enter username
    Enter password
    Log In

Fill Form
    [Tags]     "form"
    Enter Form Details