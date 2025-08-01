*** Settings ***
Resource    ../resources/auth_keywords.robot

Suite Setup    Setup All Sessions

*** Keywords ***
Setup All Sessions
    Create Session To FakeStore
    # Create Session To MongoDB


*** Test Cases ***
# ======================================
# CAS DE TESTS POUR AUTHENTIFICATION
# ======================================
Login with valid credentials
    [Tags]    auth    positive
    ${credentials}=    Create Dictionary    username=johnd   password=m38rmF$
    ${token}=    Login With Credentials    ${credentials}
    Should Not Be Empty    ${token}

Login with invalid credentials
    [Tags]    auth    negative1
    ${credentials}=    Create Dictionary    username=fakeuser    password=wrongpass
    ${token}=    Login With Credentials    ${credentials}
    Should Not Be Empty    ${token}

Login with missing password
    [Tags]    auth    negative2
    ${credentials}=    Create Dictionary    username=test2314
    ${token}=    Login With Credentials    ${credentials}
    Should Not Be Empty    ${token}
