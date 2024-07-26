*** Settings ***
Library    SeleniumLibrary
Resource    resources/commonKeywords.resource
Resource    resources/testAutomationPractice.resource

*** Variables ***
${userName}    Victor
${userEmail}    victormurilo@gmail.com
${userPhone}    (62)99999-9999
${userAddress}    Goiania - GO
${sundayText}    Sunday
${mondayText}    Monday
${tuesdayText}    Tuesday
${wednesdayText}    Wednesday
${thursdayText}    Thursday
${fridayText}    Friday
${saturdayext}    Saturday

*** Test Cases ***
Test Automation Practice using Robot Framework
    Open in Chrome Browser    ${url}

    Page Should Contain Element    ${header}
    Fill TAP Form    ${userName}    ${userEmail}    ${userPhone}    ${userAddress}
    Select Female Gender on Form

    Select Day of List    ${mondayText}
    Select Day of List    ${wednesdayText}

    Validate Day of List is Not Checked    ${sundayText}
    Validate Day of List is Checked    ${mondayText}
    Validate Day of List is Not Checked    ${tuesdayText}
    Validate Day of List is Checked    ${wednesdayText}
    Validate Day of List is Not Checked    ${thursdayText}
    Validate Day of List is Not Checked    ${fridayText}
    Validate Day of List is Not Checked    ${saturdayext}

    Sleep    3s
    [Teardown]    Close Browser
