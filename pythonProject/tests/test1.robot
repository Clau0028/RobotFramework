*** Settings ***
Documentation   To Validate The Login Form
Library    SeleniumLibrary
#Resource

*** Test Cases ***
Validate Succesful Login
    open the browser with the Mortage payment url
    #Fill the login form
    #waith until it checks and display error message
    #verify error message is correct

*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome    Service(/Users/claudiamejia/Downloads/chromedriver-mac-x64/chromedriver)
    Go To    https://rahulshettyacademy.com/loginpagePractise/


