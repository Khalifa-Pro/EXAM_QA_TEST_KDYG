*** Settings ***
Library           AppiumLibrary

Variables        ../po/variables.py
Variables        ../po/locator.py




*** Keywords ***
Open Application MyApp
    Open Application       ${REMOTE_URL}   platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    noReset=true
    
Enter username
    Wait Until Element Is Visible    ${USERNAME}    5
    Click Element    ${USERNAME}
    Input Text    ${USERNAME}    johnd
    
Enter password
    Wait Until Element Is Visible    ${PASSWORD}    5
    Click Element    ${PASSWORD}
    Input Password    ${PASSWORD}    m38rmF$

Log In
    Wait Until Element Is Visible    ${LOGIN}    5
    Click Element    ${LOGIN}
    Wait Until Page Contains Element    ${PAGE_FORM}

Enter Form Details
    Wait Until Element Is Visible    ${FORM_TITLE}    5
    Click Element    ${FORM_TITLE}
    Input Text    ${FORM_TITLE}    Test Form Title
    Wait Until Element Is Visible    ${FORM_PRICE}    5
    Click Element    ${FORM_PRICE}
    Input Text    ${FORM_PRICE}    100
    Wait Until Element Is Visible    ${FORM_DESCRIPTION}    5
    Click Element    ${FORM_DESCRIPTION}
    Input Text    ${FORM_DESCRIPTION}    This is a test description.
    Wait Until Element Is Visible    ${FORM_CATEGORIE}    5
    Click Element    ${FORM_CATEGORIE}
    Input Text    ${FORM_CATEGORIE}    Test Category
    Wait Until Element Is Visible    ${FORM_URL}    5
    Click Element    ${FORM_URL}
    Input Text    ${FORM_URL}    "C:\Users\FINAPPS\Pictures\Screenshots\Capture d'écran 2025-05-17 194829.png"    
    Wait Until Element Is Visible    ${FORM_BUTTON_ADD}    5
    Click Element    ${FORM_BUTTON_ADD}
    Wait Until Page Contains Element    ${PAGE_FORM}
    

# Fill the Form
#     Wait Until Element Is Visible    ${P}    5
#     Click Element    ${USERNAME}
#     Input Text    ${USERNAME}    johnd

#     Wait Until Element Is Visible    ${USERNAME}    5
#     Click Element    ${USERNAME}
#     Input Text    ${USERNAME}    johnd

#     Wait Until Element Is Visible    ${USERNAME}    5
#     Click Element    ${USERNAME}
#     Input Text    ${USERNAME}    johnd

#     Wait Until Element Is Visible    ${USERNAME}    5
#     Click Element    ${USERNAME}
#     Input Text    ${USERNAME}    johnd

#     Wait Until Element Is Visible    ${USERNAME}    5
#     Click Element    ${USERNAME}
#     Input Text    ${USERNAME}    johnd
    
    


