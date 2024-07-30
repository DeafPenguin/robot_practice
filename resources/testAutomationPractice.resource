*** Settings ***
Library    SeleniumLibrary
Resource    commonKeywords.resource

*** Variables ***
### PageUrl ###
${url}     https://testautomationpractice.blogspot.com/
### General Locators ###
${header}    id:header-inner
${daysList}    xpath=//*[contains(@class, 'post-body')]/div[4]/div
${openCartLink}    css:.post-body > a:nth-child(21)
${orangeHRMLink}    css:.post-body > a:nth-child(22)
### Form locators ###
${nameInput}    id:name
${emailInput}    id:email
${phoneInput}    id:phone
${addressInput}    id:textarea
${maleGenderRadioButton}    id:male
${femaleGenderRadioButton}    id:female
${countryDropdown}    id:country
${colorsList}    id:colors
### Form locators ###
${calendar}    id:datepicker
### Table locators ###
${webTable}    css:[name="BookTable"]
${paginationTable}    id:productTable

*** Keywords ***
Fill TAP Form
    [Arguments]    ${userName}    ${userEmail}    ${userPhone}    ${userAddress}
    Input Text    ${nameInput}    ${userName}
    Input Text    ${emailInput}    ${userEmail}
    Input Text    ${phoneInput}    ${userPhone}
    Input Text    ${addressInput}    ${userAddress}

Select Female Gender on Form
    Click Element    ${femaleGenderRadioButton}

Select Male Gender on Form
    Click Element    ${maleGenderRadioButton}

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

Select Country
    [Arguments]    ${userCountry}
    Select From List By Label    ${countryDropdown}    ${userCountry}

Select Color
    [Arguments]    ${color}
    Select From List By Label    ${colorsList}    ${color}

Validate Form Links
    Validate Element Link    ${openCartLink}    https://demo.opencart.com/
    Validate Element Link    ${orangeHRMLink}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

Select Date on Form
    [Arguments]    ${targetDate}
    Select Date    ${calendar}    ${targetDate}


### BDD Keywords ###
Given the page is loaded
    Open in Chrome Browser    ${url}

When I select the day "${day}"
    Select Day of List    ${day}

Then the day "${day}" should be marked as selected
    Validate Day of List is Checked    ${day}