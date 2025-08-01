*** Settings ***
Resource    ../resources/users_keywords.robot

Suite Setup    Create Session To FakeStore

*** Test Cases ***

# ======================================
# USERS - CRUD OK
# ======================================

Get All Users
    [Tags]    users    getallpassed
    ${users}=    Get All Users
    Should Not Be Empty    ${users}
    Log To Console    ${users}

Add User - Valid
    [Tags]    users    addpassed
    ${user}=    Create Dictionary    email=test@test.com    username=testuser    password=testpass
    ${response}=    Add a new user    ${user}
    Should Be Equal As Integers    ${response.status_code}    200

Get User - Existing ID
    [Tags]    users    getbyidpassed
    ${response}=    Get a single user    1
    Should Be Equal As Integers    ${response.status_code}    200

Update User - Valid
    [Tags]    users    updatepassed
    ${user}=    Create Dictionary    username=updateduser
    ${response}=    Update a user    1    ${user}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Evaluate    ${response.json()}
    Should Be Equal As Strings    ${body['username']}    updateduser

Delete User - Valid
    [Tags]    users    deletepassed
    ${response}=    Delete a user    2
    Should Be Equal As Integers    ${response.status_code}    200

# ======================================
# USERS - CRUD ERREURS
# ======================================

# Negative 1 tests for users
Get All Users with invalid session
    [Tags]    users    getallfail1
    Create Session To FakeStore
    ${response}=    Get All Users
    Should Be Equal As Strings    ${response.status_code}    401

Add User - Missing Username
    [Tags]    users    addfail1
    ${user}=    Create Dictionary    email=test@test.com
    ${response}=    Add a new user    ${user}
    Should Not Be Equal As Integers    ${response.status_code}    200

Get User - Invalid ID
    [Tags]    users   getbyidfail1
    ${response}=    Get a single user    9999
    Should Not Be Equal As Integers    ${response.status_code}    200

Update User - Non-existent ID
    [Tags]    users    updatefail1
    ${user}=    Create Dictionary    username=nonexistent
    ${response}=    Update a user    9999    ${user}
    Should Not Be Equal As Integers    ${response.status_code}    200

Delete User - Non-existent
    [Tags]    users    deletefail1
    ${response}=    Delete a user    9999
    Should Not Be Equal As Integers    ${response.status_code}    200

# Negative 2 tests for users
Get All Users with invalid parameters
    [Tags]    users    allfail2
    ${response}=    Get All Users
    Should Be Equal As Strings    ${response.status_code}    400

Get Single User with invalid ID
    [Tags]    users    getbyidfail2
    ${response}=    Get a single user    invalid_id
    Should Be Equal As Strings    ${response.status_code}    400

Update User with missing fields
    [Tags]    users    updatefail2
    ${user}=    Create Dictionary    username=updateduser
    ${response}=    Update a user    1    ${user}
    Should Be Equal As Strings    ${response.status_code}    400

Delete User with invalid ID
    [Tags]    users    deletefail2
    ${response}=    Delete a user    invalid_id
    Should Be Equal As Strings    ${response.status_code}    400



