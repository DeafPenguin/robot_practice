*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Select Element On List By Text
    [Arguments]    ${listLocator}    ${targetText}
    ${elements}=    Get WebElements   ${listLocator}
    FOR    ${element}    IN    @{elements}
        ${elementText}=    Get Text    ${element}
        Run Keyword If    '${elementText}' == '${targetText}'    Click Element    ${element}
        Exit For Loop If    '${elementText}' == '${targetText}'
    END

