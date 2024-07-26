*** Settings ***
Library    SeleniumLibrary
Resource    resources/commonKeywords.resource
Resource    resources/testAutomationPractice.resource

*** Test Cases ***
Test Automation Practice using Robot Framework
    Open in Chrome Browser    ${url}

    Page Should Contain Element    ${header}
    Fill TAP Form    Victor    victormurilo@gmail.com    62000000000    Testando campo de escrita
    Select Female Gender on Form

    Select Day of List    Monday
    Select Day of List    Wednesday

    Validate Day of List is Not Checked    Sunday
    Validate Day of List is Checked    Monday
    Validate Day of List is Not Checked    Tuesday
    Validate Day of List is Checked    Wednesday
    Validate Day of List is Not Checked    Thursday
    Validate Day of List is Not Checked    Friday
    Validate Day of List is Not Checked    Saturday

    Sleep    3s
    [Teardown]    Close Browser
