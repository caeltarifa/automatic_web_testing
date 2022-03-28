***Settings***
Library    SeleniumLibrary
Library    XvfbRobot

***Variables***
${TMP_PATH}      /tmp
${url_login}     https://phptravels.net/api/supplier
${url_inside}    https://phptravels.net/api/supplier/hotels/rooms/add

***Test Cases***
TestingInputBox
    Open Chrome Browser
    #maximize browser windows

    ### FOR TO LOGIN
    GoTo             ${url_login}
    input text       name:email                                                                                             supplier@phptravels.com
    input text       name:password                                                                                          demosupplier
    click element    xpath://button[@class="btn btn-primary btn-block ladda-button fadeIn animated mdc-ripple-upgraded"]
    Sleep            5

    ### FOR TO LOGIN

    ### AFTER LOGIN: TAKE THE VALUE OF A SELECT BY LABEL OR INDEX
    GoTo                         ${url_inside}
    select from list by label    roomstatus       Disabled
    Sleep                        5
    select from list by index    price_type       1
    ### AFTER LOGIN: TAKE THE VALUE OF A SELECT BY LABEL OR INDEX


    ### AFTER LOGIN: TAKE THE VALUE OF A
    ### AFTER LOGIN: TAKE THE VALUE OF A

    close browser

***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
