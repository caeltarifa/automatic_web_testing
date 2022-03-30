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
    ${speed_}=             get selenium speed
    log to console         ${speed_}
    Open Chrome Browser

    GoTo    ${url_register}

    sleep                 3            #wait 3 seconds for to fill out all fields of the form
    set selenium speed    3 seconds    #wait 3 seconds for to fill out each field, one for one, of the form

    select radio button    Gender                  M
    input text             name:FirstName          David
    input text             name:LastName           John
    input text             name:Email              anhc@gmail.com
    input text             name:Password           davidjohn
    input text             name:ConfirmPassword    davidjohn

    ${speed_}=             get selenium speed
    log to console         ${speed_}


***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
