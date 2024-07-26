*** Settings ***
Library    SeleniumLibrary
Resource    commonKeywords.resource

*** Variables ***
### Form locators ###
${url}     https://testautomationpractice.blogspot.com/
${header}    id:header-inner
${nameInput}    id:name
${emailInput}    id:email
${phoneInput}    id:phone
${addressInput}    id:textarea
${maleGenderRadioButton}    id:male
${femaleGenderRadioButton}    id:female
${countryDropdown}    id:country
${colors}    id:colors
### General Locators ###
${daysList}    xpath=//*[contains(@class, 'post-body')]/div[4]/div

*** Keywords ***
Fill TAP Form
    [Arguments]    ${userName}    ${userEmail}    ${userPhone}    ${userAddress}
    Input Text    ${nameInput}    ${userName}
    Input Text    ${emailInput}    ${userEmail}
    Input Text    ${phoneInput}    ${userPhone}
    Input Text    ${addressInput}    ${userAddress}

Select Gender on Form
    [Arguments]    ${gender}
    Click Element    ${gender}

Select Female Gender on Form
    Select Gender on Form    ${femaleGenderRadioButton}

Select Male Gender on Form
    Select Gender on Form    ${maleGenderRadioButton}

Select Day of List
    [Arguments]    ${day}
    Select Element On List By Text    ${daysList}    ${day}

Validate Day of List is Checked
    [Arguments]    ${day}
    ${elements}=    Get WebElements   ${daysList}
    FOR    ${element}    IN    @{elements}
        ${elementText}=    Get Text    ${element}
        ${inputElement}=    Set Variable    ${daysList}/label[text()='${day}']/preceding-sibling::input
        Run Keyword If    '${elementText}' == '${day}'    Checkbox Should Be Selected    ${inputElement}
        Exit For Loop If    '${elementText}' == '${day}'
    END

Validate Day of List is Not Checked
    [Arguments]    ${day}
    ${elements}=    Get WebElements   ${daysList}
    FOR    ${element}    IN    @{elements}
        ${elementText}=    Get Text    ${element}
        ${inputElement}=    Set Variable    ${daysList}/label[text()='${day}']/preceding-sibling::input
        Run Keyword If    '${elementText}' == '${day}'    Checkbox Should Not Be Selected    ${inputElement}
        Exit For Loop If    '${elementText}' == '${day}'
    END