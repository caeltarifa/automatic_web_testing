***Settings***

Library     SeleniumLibrary
Library    XvfbRobot


***Variables***
${TMP_PATH}    /tmp
${url}         https://gallery.wufoo.com/forms/?formname=q192izas04nvc5l&embed=1&embedKey=q192izas04nvc5l840693&entsource=&referrer=https:wuslashwuslashwww.wufoo.comwuslashgallerywuslashtemplateswuslashformswuslash#public


***Test Cases***
TestingInputBox
    Open Chrome Browser
    GoTo                   ${url}
    #maximize browser windows

    #### ------- SELECTING RADIO BUTTONS

    #Select the radio button -- by "name=Field5"-- with value "Female" of two options: Male & Females
    select radio button    Field5    I am not a member of NAME gym

    #Select the radio button -- by "name=exp"-- with value "5" of five options: 1 2 3 4 5
        #select radio button    exp    5

    
    #### ------- SELECTING CHECK BOX
    #Select the checkbox -- by "name=BlackTea"--
    #select checkbox    BlackTea
    
    #Select the checkbox -- by "name=RedTea"--
    #select checkbox    RedTea

    #unselect checkbox BlackTea

    close browser




***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
