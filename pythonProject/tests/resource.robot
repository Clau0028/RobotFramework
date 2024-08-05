*** Settings ***
Documentation


Library    SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${valid_password}       learning
${invalid_password}     6475604
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver    Chrome    Service(/Users/claudiamejia/Downloads/chromedriver-mac-x64/chromedriver)
    Go To               ${url}

Close Browser Session
        Close Browser