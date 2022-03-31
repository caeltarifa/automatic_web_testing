#alerts.robot

# accept or cancel an alert web component: handling alets or pressing ok|cancel

***Settings***
Library    SeleniumLibrary
Library    XvfbRobot

***Variables***
${TMP_PATH}        /tmp
${url_register}    https://testautomationpractice.blogspot.com/

***Test Cases***
My_test_case
    Open Chrome Browser
    GoTo                   ${url_register}

    click element    xpath://*[@id="HTML9"]/div[1]/button
    sleep            3
    #handle alert     accept
    #handle alert     dismiss
    #handle alert     leave  ## LEAVE to the alert component without action
    aelrt should be present     Press a button!     #the content of the alert component will be "Press a button!" for to PASS
    






***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
