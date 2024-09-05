*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
Resource    generic.robot

*** Variables ***
${Error_Message_Login}    xpath://body/div[@id='login']/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn

Wait Until Element Is Located In The Page
    Wait Until Element Passed Is Located On Page  ${Error_Message_Login}

Verify Error Message Is Correct
    ${result}=    Get Text        ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be        ${Error_Message_Login}    Incorrect username/password.

Fill The Login Details And Login Form

    Input Text        xpath://input[@id='username']    ${user_name}
    Input Password    xpath://input[@id='password']    ${valid_password}
    Click Element     xpath://input[@value='user']
    Wait Until Element Is Visible    xpath://div[@class='modal-body']
    Click Button    xpath://button[@id='okayBtn']
    Click Button    xpath://button[@id='okayBtn']
    Wait Until Element Is Not Visible    xpath://div[@class='modal-body']
    Select From List By Value    xpath://select[@class='form-control']    teach
    Select Checkbox    xpath://input[@id='terms']
    Checkbox Should Be Selected    xpath://input[@id='terms']