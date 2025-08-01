*** Settings ***
Library           RequestsLibrary
Variables         ../pageobject/variables.py
Library           DatabaseLibrary

*** Keywords ***
Create Session To FakeStore
    Create Session    fakestore    ${BASE_URL}    headers=${HEADERS}

# Create Session To MongoDB
#     Create Session    mongodb    ${DB_URI}    headers=${HEADERS}


# Product Keywords
Add a new product
    [Arguments]    ${product}
    ${response}=    POST On Session    fakestore    /products    json=${product}
    RETURN    ${response}

Get all products
    ${response}=    GET On Session    fakestore    /products
    Should Be Equal As Strings    ${response.status_code}    200
    ${json}=    To JSON    ${response.content}
    [Return]    ${json}

Get a single product
    [Arguments]    ${id}
    ${response}=    GET On Session    fakestore    /products/${id}
    RETURN    ${response}

Update a product
    [Arguments]    ${id}    ${product}
    ${response}=    PUT On Session    fakestore    /products/${id}    json=${product}
    RETURN    ${response}

Delete a product
    [Arguments]    ${id}
    ${response}=    DELETE On Session    fakestore    /products/${id}
    RETURN    ${response}

# User Keywords
Add a new user
    [Arguments]    ${user}
    ${response}=    POST On Session    fakestore    /users    json=${user}
    RETURN    ${response}

Get all users
    ${response}=    GET On Session    fakestore    /users
    RETURN    ${response}

Get a single user
    [Arguments]    ${id}
    ${response}=    GET On Session    fakestore    /users/${id}
    RETURN    ${response}

Update a user
    [Arguments]    ${id}    ${user}
    ${response}=    PUT On Session    fakestore    /users/${id}    json=${user}
    RETURN    ${response}

Delete a user
    [Arguments]    ${id}
    ${response}=    DELETE On Session    fakestore    /users/${id}
    RETURN    ${response}
