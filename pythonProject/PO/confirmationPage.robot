*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
Resource    generic.robot


*** Variables ***
${Shop_page_Load}         xpath://a[normalize-space()='Shop']
${country_location}       xpath://a[normalize-space()='India']



*** Keywords ***

Enter The Country And Select The Terms
    [Arguments]    ${country_name}
    Input Text     xpath://input[@id='country']    ${country_name}
    Sleep    3
    Wait Until Element Passed Is Located On Page    xpath://a[normalize-space()='${country_name}']
    Click Element    xpath://a[normalize-space()='${country_name}']
    Click Element    xpath://label[@for='checkbox2']


Purchase The product And Confirm The Purchase
    Click Button    xpath://input[@value='Purchase']
    Page Should Contain    Success!