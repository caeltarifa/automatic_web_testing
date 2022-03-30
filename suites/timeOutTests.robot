# selenium spedd
# selecnium timeout
# selenium wait
# sleep

***Settings***
Library    SeleniumLibrary
Library    XvfbRobot

***Variables***
${TMP_PATH}        /tmp
${url_register}    http://demowebshop.tricentis.com/register

***Test Cases***
Testing_wait_timeouts
    Open Chrome Browser

    GoTo    ${url_register}

    ${time}=    get selenium timeout 
    log to console  ${time}

    set selenium timeout        10 seconds      #wai 10 seconds until appear the keyword "Register" in the web page HTML
    wait until page contains    Register


    select radio button    Gender                  M
    input text             name:FirstName          David
    input text             name:LastName           John
    input text             name:Email              anhc@gmail.com
    input text             name:Password           davidjohn
    input text             name:ConfirmPassword    davidjohn



***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
