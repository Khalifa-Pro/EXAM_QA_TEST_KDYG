*** Settings ***
Resource    ../resources/product_keywords.robot

Suite Setup    Setup All Sessions

*** Keywords ***
Setup All Sessions
    Create Session To FakeStore
    # Create Session To MongoDB

*** Test Cases ***

# =====================================#
# PRODUCTS - CRUD OK                   #
# =====================================#

Get all products
    [Tags]    products    getallpassed
    ${response}=    Get all products
    Should Not Be Empty    ${response}
    Log To Console    ${response}

Add Product - Valid
    [Tags]    products    addpassed
    ${product}=    Create Dictionary    title=New Bag    price=99.99    description=A new stylish bag    category=bags    image=bag.jpg
    ${response}=    POST On Session    fakestore    /products    json=${product}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    To JSON    ${response.content}
    Should Be Equal As Strings    ${body['title']}    New Bag

Get Product - Existing ID
    [Tags]    products    getbyidpassed
    ${response}=    Get a single product    1
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ${response.json()}

Update Product - Valid
    [Tags]    products    updatepassed
    ${product}=    Create Dictionary    title=Updated Product    price=199.99
    ${response}=    Update a product    1    ${product}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    To JSON    ${response.content}

Delete Product - Valid ID
    [Tags]    products    deletepassed
    ${response}=    Delete a product    2
    Should Be Equal As Integers    ${response.status_code}    200

# ======================================
# PRODUCTS - CRUD ERREURS
# ======================================

# Negative 1 tests for products
Add Product - Missing Title
    [Tags]    products    addfail1
    ${product}=    Create Dictionary    price=199.99
    ${response}=    Add a new product    ${product}
    Should Not Be Equal As Integers    ${response.status_code}    200

Get Product - Invalid ID
    [Tags]    products    getbyidfail1
    ${response}=    Get a single product    9999
    Should Not Be Equal As Integers    ${response.status_code}    200

Update Product - Non-existent ID
    [Tags]    products    updatefail1
    ${product}=    Create Dictionary    title=Non-existent Product    price=299.99
    ${response}=    Update a product    9999    ${product}
    Should Not Be Equal As Integers    ${response.status_code}    200

Delete Product - Non-existent
    [Tags]    products    deletefail1
    ${response}=    Delete a product    9999
    Should Not Be Equal As Integers    ${response.status_code}    200

# Negative 2 tests for products
Get all products with invalid parameters
    [Tags]    products    getallfail2
    ${response}=    Get All Products
    Should Be Equal As Strings    ${response.status_code}    400
    
Get single product with invalid ID
    [Tags]    products    getbyidfail2
    ${response}=    Get a single product    invalid_id
    Should Be Equal As Strings    ${response.status_code}    400

Update product with missing fields
    [Tags]    products    updatefail2
    ${product}=    Create Dictionary    price=199.99
    ${response}=    Update a product    1    ${product}
    Should Be Equal As Strings    ${response.status_code}    400

Delete product with invalid ID
    [Tags]    products    deletefail2
    ${response}=    Run Keyword And Expect Error    *    Delete a product    invalid_id
    Should Be Equal As Strings    ${response.status_code}    400

