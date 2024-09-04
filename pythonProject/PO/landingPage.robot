*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary

*** Variables ***
${Error_Message_Login}    xpath://body/div[@id='login']/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn

Wait until element is located in the page
    Wait Until Element Is Visible  ${Shop_page_Load}

Verify Error Message Is Correct
   ${result}=    Get Text        ${Error_Message_Login}
   Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be        ${Error_Message_Login}    Incorrect username/password.
