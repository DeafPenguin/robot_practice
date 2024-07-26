*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open in Chrome Browser
    [Arguments]    ${address}
    Open Browser    ${address}    chrome
    Maximize Browser Window

Select Element On List By Text
    [Arguments]    ${listLocator}    ${targetText}
    ${elements}=    Get WebElements   ${listLocator}
    FOR    ${element}    IN    @{elements}
        ${elementText}=    Get Text    ${element}
        Run Keyword If    '${elementText}' == '${targetText}'    Click Element    ${element}
        Exit For Loop If    '${elementText}' == '${targetText}'
    END

Validate Element Link
    [Arguments]    ${locator}    ${expectedLink}
    ${link}=    Get Element Attribute    ${locator}    href
    Should Be Equal As Strings    ${link}    ${expectedLink}