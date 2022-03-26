***Settings***

Library     SeleniumLibrary
#Library    XvfbRobot


***Variables***
${TMP_PATH}    /tmp
${url}         https://my.forms.app/templatesen/new-customer-registration-form
***Test Cases***
TestingInputBox
    Open Chrome Browser
    GoTo                   ${url}
    #maximize browser windows

    #### ------- SELECTING RADIO BUTTONS

    #Select the radio button -- by "name=sex"-- with value "Female" of two options: Male & Females
    select radio button    sex    Female

    #Select the radio button -- by "name=exp"-- with value "5" of five options: 1 2 3 4 5
    select radio button    exp    5

    #### ------- SELECTING CHECK BOX
    #Select the checkbox -- by "name=BlackTea"--
    select checkbox    BlackTea
    #Select the checkbox -- by "name=RedTea"--
    select checkbox    RedTea

    unselect checkbox BlackTea



***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
