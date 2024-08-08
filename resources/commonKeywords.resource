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

Validate Selected Dropdown Option
    [Arguments]    ${dropdownLocator}    ${expectedOption}
    ${selectedOption}=    Get Selected List Label    ${dropdownLocator}
    Should Be Equal    ${selectedOption}    ${expectedOption}

Validate Not Selected Dropdown Option
    [Arguments]    ${dropdownLocator}    ${expectedOption}
    ${selectedOption}=    Get Selected List Label    ${dropdownLocator}
    Should Not Be Equal    ${selectedOption}    ${expectedOption}

Validate Element Link
    [Arguments]    ${locator}    ${expectedLink}
    ${link}=    Get Element Attribute    ${locator}    href
    Should Be Equal As Strings    ${link}    ${expectedLink}