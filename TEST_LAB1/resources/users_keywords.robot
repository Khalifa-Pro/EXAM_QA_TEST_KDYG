*** Settings ***
Library    RequestsLibrary
Variables  ../pageobject/variables.py

*** Keywords ***
Create Session To FakeStore
    Create Session    fakestore    ${BASE_URL}    headers=${HEADERS}

# User Management Keywords
Get All Users
    ${response}=    GET On Session    fakestore    /users
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Add a new user
    [Arguments]    ${user}
    ${response}=    POST On Session    fakestore    /users    json=${user}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Get a single user
    [Arguments]    ${id}
    ${response}=    GET On Session    fakestore    /users/${id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Update a user
    [Arguments]    ${id}    ${user}
    ${response}=    PUT On Session    fakestore    /users/${id}    json=${user}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Delete a user
    [Arguments]    ${id}
    ${response}=    DELETE On Session    fakestore    /users/${id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
