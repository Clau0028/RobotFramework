*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn
