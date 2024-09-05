*** Settings ***
Documentation


Library    SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${valid_password}       learning
${invalid_password}     6475604
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${browser_name}         Chrome

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver    Chrome    Service(/Users/claudiamejia/Downloads/chromedriver-mac-x64/chromedriver)
    Go To               ${url}

Open The Browser With The Url
    Create Webdriver    ${browser_name}    Service(/Users/claudiamejia/Downloads/${browser_name}
    Go To    ${url}

Wait Until Element Passed Is Located On Page
    [Arguments]    ${Page_Locator}
    Wait Until Element Is Visible  ${Page_Locator}

Close Browser Session
    Close Browser