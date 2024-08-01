*** Settings ***
Documentation    To Validate The Login Form
Library          SeleniumLibrary
Test Setup       open the browser with the Mortgage payment url
#Test Teardown    Close Browser Session
Resource         resource.robot



*** Variables ***
${Error_Message_Login}    xpath://body/div[@id='login']/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]
${Shop_page_Load}         xpath://a[normalize-space()='Shop']

*** Test Cases ***
#Validate Unsuccessful login

#    Fill the login form    ${user_name}    ${invalid_password}
 #   Wait until element is located in the page    ${Error_Message_Login}
  #  verify error message is correct

Validate cards display in the shopping page
    Fill The Login Form    ${user_name}     ${valid_password}
    Wait Until Element Is Located In The Page    ${Shop_page_Load}
    Verify Card Titles In The Shop Page
    Select The Card    Nokia Edge

Select The Form And Navigate To Child Window
    
    Fill The Login Details And Login Form



*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}    
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn

    
Wait until element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible  ${element}
    
Verify Error Message Is Correct
   ${result}=    Get Text        ${Error_Message_Login} 
   Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be        ${Error_Message_Login}    Incorrect username/password.

Verify Card Titles In The Shop Page
    @{expectedList}=    Create List   iphone X     Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=     Get Webelements    xpath:(//h4[@class='card-title'])
    @{actualList}=    Create List    
    FOR    ${element}    IN    @{elements}
          Log    ${element.text}

    END


Select The Card
    [Arguments]    ${cardName}
    ${elements}=    Get Webelements    xpath:(//h4[@class='card-title'])
    ${index}=    Set Variable    1
        FOR    ${element}    IN    @{elements}
            Exit For Loop If        '${cardName}' =='${element.text}'
            ${index}=    Evaluate    ${index} + 1

        END
     
    Click Button    xpath://app-card[${index}]//div[1]//div[2]//button[1]


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

    