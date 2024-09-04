*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary


*** Variables ***
${Shop_page_Load}         xpath://a[normalize-space()='Shop']



*** Keywords ***

Wait until element is located in the page
    Wait Until Element Is Visible  ${Shop_page_Load}

Verify Card Titles In The Shop Page
    @{expectedList}=    Create List   iphone X     Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=     Get Webelements    xpath:(//h4[@class='card-title'])
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
          Log    ${element.text}

    END