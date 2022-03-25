***Settings***
Library    SeleniumLibrary

Library    XvfbRobot

*** Variables ***
${TMP_PATH}    /tmp

***Test Cases***
TestingInputBox
    Open Chrome Browser
    GoTo                        https://demo.nopcommerce.com/
    #maximize browser windows
    
    #the comparison between two titles #
    title should be             nopcommerce demo start  #FALSE OR FAIL
    #title should be             nopCommerce demo store  #TRUE OR PASS
    
    click link                  xpath://a[@class="ico-login"]
    ${"email_txt"}              set Variable                     id:Email

    element should be visible    ${"email_txt"}
    element should be enabled    ${"email_txt"}

    input text            ${"email_txt"}    JohnDavid@gmail.com
    sleep                 5
    clear element text    ${"email_txt"}
    sleep                 3
    close browser

***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
