*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
Resource    generic.robot


*** Variables ***
${Shop_page_Load}         xpath://a[normalize-space()='Shop']



*** Keywords ***

Verify Items In The Checkout Page and Checkout
    Click Button    xpath://button[normalize-space()='Checkout']