*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
Resource    generic.robot


*** Variables ***
${Shop_page_Load}         xpath://a[normalize-space()='Shop']



*** Keywords ***

Wait Until Element Is Located In The Page
    Wait Until Element Passed Is Located On Page  ${Shop_page_Load}


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
            Exit For Loop If        '${cardName}' == '${element.text}'
            ${index}=    Evaluate    ${index} + 1

        END

    Click Button    xpath://app-card[${index}]//div[1]//div[2]//button[1]