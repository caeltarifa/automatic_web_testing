*** Settings ***
Library    SeleniumLibrary
Library    XvfbRobot

*** Variables ***
${TMP_PATH}    /tmp

***Test Cases***

LoginTest
    Start Virtual Display    1920                                             1080
    Open Chrome Browser
    GoTo                     https://demo.nopcommerce.com/
    click link               xpath://a[@class='ico-login']
    input text               id:Email                                         pavanoltraining@gmail.com
    input text               id:Password                                      Test@123
    click element            xpath://button[@class="button-1 login-button"]
    close browser


***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}

