# locator.py

# ------------- LOCATORS SIGNIN ---------------------------
CLICK_BUTTON_SIGNIN = "name=sign-in-link"
LOGIN_INPUT = "name=email-name"
PASSWORD_INPUT = "name=password-name"
REMEMBER_ME_CHECKBOX = "id=remember"
LOGIN_BUTTON = "name=submit-name"
FAILED_MESSAGE = "Username ou Mot de passe incorrect"
SUCCESS_MESSAGE = "Login successful"
CLICK_BUTTON_SIGNOUT = "xpath=//a[normalize-space(text())='Sign Out']"


# ------------ - LOCATORS DASHBOARD ---------------------------
ADD_NEW_CUSTOMER = "id=new-customer"

# ------------ - LOCATORS ADD NEW CUSTOMER ---------------------------
EMAIL_INPUT = "id=EmailAddress"
FIRST_NAME_INPUT = "id=FirstName"
LAST_NAME_INPUT = "id=LastName"
CITY_INPUT = "id=City"
STATE_INPUT = "id=StateOrRegion"
Gender_INPUT = "xpath=//input[@name='gender' and @value='male']"  
PROMOS_INPUT = "xpath=//input[@type='checkbox' and @name='promos-name']"
SUBMIT_BUTTON = "xpath=//button[@type='submit']"
CANCEL_NEW_CUSTOMER = "xpath=//a[normalize-space(text())='Cancel']"