*** Settings ***
Resource    ../resources/carts_keywords.robot

Suite Setup    Setup All Sessions

*** Keywords ***
Setup All Sessions
    Create Session To FakeStore
    # Create Session To MongoDB

*** Test Cases ***
# ======================================
# CARTS - CRUD OK
# ======================================
Get all carts
    [Tags]    carts    positive1
    ${carts}=    Get All Carts
    Should Not Be Empty    ${carts}
    Log To Console    ${carts}

Add a new cart
    [Tags]    carts    positive2
    ${products}=    Create List
    ...    Create Dictionary    productId=18    quantity=2

    ${cart}=    Create Dictionary
    ...    userId=1
    ...    date=2020-02-03
    ...    products=${products}

    ${response}=    POST On Session    fakestore    /carts    json=${cart}
    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    To JSON    ${response.content}
    Should Be Equal As Integers    ${body['userId']}    1

Get single cart by ID
    [Tags]    carts    positive3
    ${cart}=    Get a single cart    1
    Should Contain    ${cart}    id

Update existing cart
    [Tags]    carts    positive4
    ${products}=    Create List
    ...    Create Dictionary    productId=18    quantity=2
    ${updated_cart}=    Create Dictionary    
    ...    userId=1    
    ...    date=2020-02-03    
    ...    products=${products}
    ${response}=    Update a cart    1    ${updated_cart}
    Should Contain    ${response}    products

Delete cart by ID
    [Tags]    carts    positive5
    ${response}=    Delete a cart    1
    Should Contain    ${response}    id

# ======================================
# CARTS - CRUD ERREURS
# ======================================    

# Negative 1 tests for carts
Get non-existing cart
    [Tags]    carts    negative1_1
    ${response}=    Get a single cart    9999
    Should Be Equal As Strings    ${response["message"]}    Not Found
    Should Be Equal As Integers    ${response.status_code}    200

Get all carts with invalid session
    [Tags]    carts    negative1_2
    Create Session To FakeStore
    ${response}=    Get All Carts
    Should Be Equal As Strings    ${response.status_code}    200

Add cart with missing userId
    [Tags]    carts    negative1_3
    ${cart}=    Create Dictionary    date=2020-02-03    products=[{"productId":1,"quantity":2}]
    ${response}=    Add a new cart    ${cart}
    Should Be Equal As Strings    ${response.status_code}    200

Update cart with invalid ID
    [Tags]    carts    negative1_4
    ${updated_cart}=    Create Dictionary    userId=1    date=2020-02-03    products=[{"productId":2,"quantity":5}]
    ${response}=    Update a cart    9999    ${updated_cart}
    Should Be Equal As Strings    ${response.status_code}    200

Delete non-existing cart
    [Tags]    carts    negative1_5
    ${response}=    Delete a cart    9999
    Should Be Equal As Strings    ${response.status_code}    200

# Negative 2 tests for carts
Get all carts with invalid parameters
    [Tags]    carts    negative2_1
    ${response}=    Get All Carts
    Should Be Equal As Strings    ${response.status_code}    200

Get single cart with invalid ID
    [Tags]    carts    negative2_2
    ${response}=    Get a single cart    invalid_id
    Should Be Equal As Strings    ${response.status_code}    200

Update cart with missing products
    [Tags]    carts    negative2_3
    ${updated_cart}=    Create Dictionary    userId=1    date=2020-02-03
    ${response}=    Update a cart    1    ${updated_cart}
    Should Be Equal As Strings    ${response.status_code}    200

Delete cart with invalid ID
    [Tags]    carts    negative2_4
    ${response}=    Run Keyword And Expect Error    *    Delete a cart    invalid_id
    ${response}=    Delete a cart    invalid_id
    Should Be Equal As Strings    ${response.status_code}    200
