*** Settings ***
Documentation    To Validate The Login Form
Library          SeleniumLibrary
Library    String
Library    Collections
Test Setup       open the browser with the Mortgage payment url
Test Teardown    Close Browser Session
Resource         resource.robot


*** Variables ***
${Error_Message_Login}    xpath://body/div[@id='login']/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]

*** Test Cases ***
Validate Child Window Functionality
    Select of Child window
    Verify The User Is Switched To Child Window
    Grab The Email Id In The Child Window
    Switch To Parent Window And Enter The Email

*** Keywords ***
Select of Child window
    Click Element    xpath://a[@class='blinkingText']
    Sleep            5

Verify The User Is Switched To Child Window
    Switch Window    NEW
    Element Text Should Be    //div/h1[contains(.,'Documents request')]    DOCUMENTS REQUEST

Grab The Email Id In The Child Window
    ${text}=    Get Text    xpath://p[@class='im-para red']
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
    @{words2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words2}    0
    Set Global Variable    ${email}

Switch To Parent Window And Enter The Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
     Input Text        id:username    ${email}




    