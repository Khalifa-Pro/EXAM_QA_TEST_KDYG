*** Settings ***
Library           RequestsLibrary
Library           ../pageobject/MongoKeywords.py    WITH NAME    MongoLib
Variables         ../pageobject/variables.py

*** Keywords ***
Setup All Sessions
    Create Session    fakestore    ${BASE_URL}    headers=${HEADERS}
    Connect To MongoDB    ${DB_URI}    fakestore

Connect To MongoDB
    [Arguments]    ${uri}    ${db_name}
    ${db}=    MongoLib.connect_to_mongodb    ${uri}    ${db_name}
    Set Test Variable    ${DB}    ${db}


Login With Credentials
    [Arguments]    ${credentials}
    ${response}=    POST On Session    fakestore    /auth/login    json=${credentials}
    Should Be Equal As Strings    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    RETURN    ${json}
