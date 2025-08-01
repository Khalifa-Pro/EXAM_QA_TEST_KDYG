*** Settings ***
Library           RequestsLibrary
Variables         ../pageobject/variables.py
Library           DatabaseLibrary

*** Keywords ***
Create Session To FakeStore
    Create Session    fakestore    ${BASE_URL}    headers=${HEADERS}

# Create Session To MongoDB
#     Create Session    mongodb    ${DB_URI}    headers=${HEADERS}

Login With Credentials
    [Arguments]    ${credentials}
    ${response}=    POST On Session    fakestore    /auth/login    json=${credentials}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
