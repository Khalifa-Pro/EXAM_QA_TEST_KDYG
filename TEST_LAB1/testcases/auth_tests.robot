*** Settings ***
Resource    ../resources/auth_keywords.robot
Suite Setup    Setup All Sessions

*** Test Cases ***
# ======================================
# CAS DE TESTS POUR AUTHENTIFICATION
# ======================================

Login with valid credentials
    [Tags]    auth    positive
    ${credentials}=    Create Dictionary    username=johnd    password=m38rmF$

    ${token}=    Login With Credentials    ${credentials}
    Should Not Be Empty    ${token}

Login with invalid credentials
    [Tags]    auth    negative1
    ${credentials}=    Create Dictionary    username=fakeuser    password=wrongpass
    ${response}=    POST On Session    fakestore    /auth/login    json=${credentials}
    Should Be Equal As Strings    ${response.status_code}    401
    Should Contain    ${response.text}    Invalid

Login with missing password
    [Tags]    auth    negative2
    ${credentials}=    Create Dictionary    username=test2314
    ${response}=    POST On Session    fakestore    /auth/login    json=${credentials}
    Should Be Equal As Strings    ${response.status_code}    400
