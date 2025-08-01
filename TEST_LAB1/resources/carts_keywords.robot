*** Settings ***
Library           RequestsLibrary
Variables         ../pageobject/variables.py
Library           DatabaseLibrary

*** Keywords ***
Create Session To FakeStore
    Create Session    fakestore    ${BASE_URL}    headers=${HEADERS}

Create Session To MongoDB
    Create Session    mongodb    ${DB_URI}    headers=${HEADERS}


# Cart Management Keywords
Get All Carts
    ${response}=    GET On Session    fakestore    /carts
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Add a new cart
    [Arguments]    ${cart}
    ${response}=    POST On Session    fakestore    /carts    json=${cart}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Get a single cart
    [Arguments]    ${id}
    ${response}=    GET On Session    fakestore    /carts/${id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Update a cart
    [Arguments]    ${id}    ${cart}
    ${response}=    PUT On Session    fakestore    /carts/${id}    json=${cart}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Delete a cart
    [Arguments]    ${id}
    ${response}=    DELETE On Session    fakestore    /carts/${id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
