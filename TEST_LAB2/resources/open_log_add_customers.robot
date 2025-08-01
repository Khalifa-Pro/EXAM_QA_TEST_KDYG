*** Settings ***
Library           SeleniumLibrary
Variables         ../pageobject/variables.py
Variables         ../pageobject/locators.py

*** Keywords ***
Should be able to add new customer
    [Documentation]    Ajoute un nouveau client après connexion réussie

    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    ${CLICK_BUTTON_SIGNIN}    timeout=10s
    Click Element    ${CLICK_BUTTON_SIGNIN}

    Wait Until Element Is Visible    ${LOGIN_INPUT}    timeout=10s
    Input Text    ${LOGIN_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${ADD_NEW_CUSTOMER}    timeout=10s
    Click Element    ${ADD_NEW_CUSTOMER}

    # Champ Email
    Wait Until Element Is Visible    ${EMAIL_INPUT}    timeout=10s
    Input Text    ${EMAIL_INPUT}    diadhiouababacarpro@gmail.com

    Sleep    2s

    # Prénom
    Input Text    ${FIRST_NAME_INPUT}    Khalifa Ababacar

    Sleep    2s
    
    # Nom
    Input Text    ${LAST_NAME_INPUT}    Diadhiou

    Sleep    2s

    # Ville
    Input Text    ${CITY_INPUT}    Dakar

    Sleep    2s

    # Sélection de l'état
    Select From List By Value    ${STATE_INPUT}    NY

    Sleep    2s

    # Genre - Male
    Click Element    ${Gender_INPUT}

    Sleep    2s

    # Ajout à la liste promotionnelle
    Click Element    ${PROMOS_INPUT}

    Sleep    2s
    
    # Soumettre le formulaire
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    timeout=10s
    Click Button    ${SUBMIT_BUTTON}

    Sleep    3s
    Wait Until Page Contains    Customer Successfully Added    timeout=5s

close browser
    Close Browser
