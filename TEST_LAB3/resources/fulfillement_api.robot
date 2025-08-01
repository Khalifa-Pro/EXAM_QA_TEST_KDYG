*** Settings ***
Library    RequestsLibrary
Variables  ../pageobject/variables.py

*** Keywords ***
Create Session To Fulfillment API
    Create Session    fulfillment    ${BASE_URL}    headers=${HEADERS}

Get Orders
    [Arguments]    ${params}=${EMPTY}
    ${response}=    GET On Session    fulfillment    /order    params=${params}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}


Get Order By Id
    [Arguments]    ${order_id}
    ${response}=    GET On Session    fulfillment    /order/${order_id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Run Get Order By Valid Id Test
    [Arguments]    ${order_id}
    ${order}=    Get Order By Id    ${order_id}
    Should Not Be Empty    ${order}
    Log To Console    ${order}


Issue Refund
    [Arguments]    ${order_id}    ${refund_data}
    ${response}=    POST On Session    fulfillment    /order/${order_id}/issue_refund
    Should Be Equal As Strings    ${response.status_code}    200    msg="Refund issued successfully"
    RETURN    ${response.json()}

