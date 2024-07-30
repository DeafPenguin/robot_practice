*** Settings ***
Library    SeleniumLibrary
Resource    lists.resource
Resource    datepicker.resource
Resource    tables.resource

*** Keywords ***
Open in Chrome Browser
    [Arguments]    ${address}
    Open Browser    ${address}    chrome
    Maximize Browser Window

Validate Element Link
    [Arguments]    ${locator}    ${expectedLink}
    ${link}=    Get Element Attribute    ${locator}    href
    Should Be Equal As Strings    ${link}    ${expectedLink}