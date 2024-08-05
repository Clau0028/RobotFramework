*** Settings ***
Documentation    To Validate The Login Form
Library          SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login


*** Variables ***
${Error_Message_Login}    xpath://body/div[@id='login']/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]

*** Test Cases ***    username    password
Invalid Username    jdjjfjje        Learning
Invalid Password    rahulshetty     khjhdhdh
Special Characters    "=&           Learning
    
   
*** Keywords ***
 
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome    Service(/Users/claudiamejia/Downloads/chromedriver-mac-x64/chromedriver)
    Go To               https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        xpath://input[@id='username']    ${username}
    Input Password    xpath://input[@id='password']    ${password}
    Click Button      xpath://input[@id='signInBtn']

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
   ${result}=    Get Text        ${Error_Message_Login} 
   Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be        ${Error_Message_Login}    Incorrect username/password.
   

    