#iframes.robot

#alerts.robot

# accept or cancel an alert web component: handling alets or pressing ok|cancel

***Settings***
Library    SeleniumLibrary
Library    XvfbRobot

***Variables***
${TMP_PATH}    /tmp
${url}         https://www.selenium.dev/selenium/docs/api/java/index.html?overview-summary.html

***Test Cases***
My_test_case
    Open Chrome Browser
    GoTo                   ${url}

    select frame      packageListFrame
    click link        org.openqa.selenium
    unselect frame

    sleep             3
    select frame      packageFrame
    click link        WebDriver
    unselect frame

    sleep             3
    select frame      classFrame
    click link        Help          #<a href="help-doc.html">Help</a>
    unselect frame


    close browser




***Keywords***
Open Chrome Browser
    ${options}          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method         ${options}           add_argument                                         --no-sandbox
    ${prefs}            Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method         ${options}           add_experimental_option                              prefs                      ${prefs}
    Create Webdriver    Chrome               chrome_options=${options}
