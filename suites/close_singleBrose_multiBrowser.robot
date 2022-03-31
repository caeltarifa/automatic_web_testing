# close single and multi browser

***Settings***
Library    SeleniumLibrary
Library    XvfbRobot

***Variables***
${TMP_PATH}        /tmp
${url_register}    http://demowebshop.tricentis.com/register

***Test Cases***
My_test_case
    Open Chrome Browser
    GoTo                   ${url_register}


    open browser    ${url_register}    chrome
    maximize browser window

    open browser    ${url_register}    chrome
    maximize browser window

    close all browsers




***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
