# MESSAGE             =   "//android.widget.EditText[@resource-id=\"com.whatsapp:id/entry\"]"
# ENVOYER              =   '//android.widget.ImageButton[@content-desc="Envoyer"]'

# Plus stable que les XPath profonds.

# Moins sensible aux petits changements d’UI.

# Compatible avec Appium Inspector.

# Plus performant dans les tests Android natifs.


# USERNAME            =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]"
# PASSWORD            =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]"
# LOGIN               =   "//android.widget.Button[@content-desc=\"Se connecter\"]"
# PAGE_FORM           =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]"

# FORM ELEMENTS
# FORM_TITLE          =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[1]"
# FORM_PRICE          =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[2]"
# FORM_DESCRIPTION    =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[3]"
# FORM_CATEGORIE      =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[4]"
# FORM_URL            =   "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[5]"
# FORM_BUTTON_ADD     =   "//android.widget.Button[@content-desc=\"Ajouter\"]"


# Les UiSelector sont plus stables et performants que les XPath profonds.

# Plus stable que les XPath profonds.

# Moins sensible aux petits changements d’UI.

# Compatible avec Appium Inspector.

# Plus performant dans les tests Android natifs.

# FORMULAIRE
PAGE_FORM = 'android=new UiSelector().className("android.view.View").instance(5)'

# LOGIN PAGE
USERNAME = 'android=new UiSelector().className("android.widget.EditText").instance(0)'
PASSWORD = 'android=new UiSelector().className("android.widget.EditText").instance(1)'
LOGIN    = 'accessibility_id=Se connecter'

# FORM PAGE
FORM_TITLE        = 'android=new UiSelector().className("android.widget.EditText").instance(0)'
FORM_PRICE        = 'android=new UiSelector().className("android.widget.EditText").instance(1)'
FORM_DESCRIPTION  = 'android=new UiSelector().className("android.widget.EditText").instance(2)'
FORM_CATEGORIE    = 'android=new UiSelector().className("android.widget.EditText").instance(3)'
FORM_URL          = 'android=new UiSelector().className("android.widget.EditText").instance(4)'
FORM_BUTTON_ADD   = 'accessibility_id=Ajouter'

