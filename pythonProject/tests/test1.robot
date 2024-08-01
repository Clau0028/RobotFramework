*** Settings ***
Documentation    To Validate The Login Form
Library          SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${Error_Message_Login}    xpath://body/div[@id='login']/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]

*** Test Cases ***
Validate Successful Login
    open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome    Service(/Users/claudiamejia/Downloads/chromedriver-mac-x64/chromedriver)
    Go To               https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    53748959
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
   ${result}=    Get Text        ${Error_Message_Login} 
   Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be        ${Error_Message_Login}    Incorrect username/password.
   

    