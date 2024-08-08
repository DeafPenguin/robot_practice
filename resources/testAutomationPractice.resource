*** Settings ***
Library    SeleniumLibrary
Resource    commonKeywords.resource

*** Variables ***
### PageUrl ###
${url}     https://testautomationpractice.blogspot.com/
### General Locators ###
${header}    id:header-inner
${nameInput}    id:name
${emailInput}    id:email
${phoneInput}    id:phone
${addressInput}    id:textarea
${genderList}    xpath=//input[@name="gender"]
${maleGenderRadioButton}    id:male
${femaleGenderRadioButton}    id:female
${daysList}    xpath=//*[contains(@class, 'post-body')]/div[4]/div
${countryDropdown}    id:country
${colorsList}    id:colors
${openCartLink}    css:.post-body > a:nth-child(21)
${orangeHRMLink}    css:.post-body > a:nth-child(22)
### Datepicker locators ###
${calendar}    id:datepicker
### Table locators ###
${webTable}    css:[name="BookTable"]
${paginationTable}    id:productTable

*** Keywords ***
### E2E Keywords ###
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
Select Gender on Form
    [Arguments]    ${gender}
    IF    "${gender}" == "Male"
        Select Male Gender on Form
    ELSE IF    "${gender}" == "Female"
        Select Female Gender on Form
    END

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
    [Arguments]    @{colors}
    FOR    ${element}    IN    @{colors}
        Press Key    ${colorsList}    CTRL
        Select From List By Label    ${colorsList}    ${element}
    END

Validate Selected Colors
    [Arguments]    @{expectedColors}
    ${selectedColors}=    Get Selected List Labels    ${colorsList}
    Lists Should Be Equal    ${selectedColors}    ${expectedColors}

Validate Form Links
    Validate Element Link    ${openCartLink}    https://demo.opencart.com/
    Validate Element Link    ${orangeHRMLink}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

Select Date on Form
    [Arguments]    ${targetDate}
    Select Date    ${calendar}    ${targetDate}

*** Keywords ***
### BDD Keywords ###
Test Automation Practice page is loaded
    Open in Chrome Browser    ${url}

The header is visible
    Element Should Be Visible    ${header}
I select the "${gender}" gender
    Select Gender on Form    ${gender}

I select the day "${day}"
    Select Day of List    ${day}

The day "${day}" should be marked as selected
    Validate Day of List is Checked    ${day}

The day "${day}" should not be marked as selected
    Validate Day of List is Not Checked   ${day}

I select the country "${country}"
    Select Country    ${country}

The country "${country}" should be marked as selected
    Validate Selected Dropdown Option    ${countryDropdown}    ${country}

The country "${country}" should not be marked as selected
    Validate Not Selected Dropdown Option    ${countryDropdown}    ${country}

I select the following colors:
    [Arguments]    @{colors}
    Select Color    @{colors}

Those following colors should be highlighted:
    [Arguments]    @{colors}
    Validate Selected Colors    @{colors}

The form links should redirect to their respective addresses
    Validate Form Links

