*** Settings ***
Documentation     Scénarios de test d'authentification
Resource          ../resources/authentication.robot

*** Test Cases ***
Cas1-Login correcte et mot de passe incorrect
    [Tags]    smoke    auth
    Open Login Page
    Input Text    ${LOGIN_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    wrongpassword
    Submit Login Form
    Element Should Not Be Visible    ${SUCCESS_MESSAGE}
    Close Browser

Cas2-Login incorrecte et mot de passe incorrecte
    [Tags]    sanity    auth
    Open Login Page
    Input Text    ${LOGIN_INPUT}    wronguser
    Input Text    ${PASSWORD_INPUT}    wrongpassword
    Submit Login Form
    Element Should Not Be Visible    ${SUCCESS_MESSAGE}
    Close Browser
Cas3-Login correcte et mot de passe correcte
    [Tags]    regression    auth
    Open Login Page
    Click Sign In Button
    Wait Until Element Is Visible    ${LOGIN_INPUT}    timeout=10s
    Input Text    ${LOGIN_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Submit Login Form
    Element Should Be Visible    ${SUCCESS_MESSAGE}
    Close Browser