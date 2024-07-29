*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/testAutomationPractice.resource

*** Variables ***
${userName}    Victor
${userEmail}    victormurilo@gmail.com
${userPhone}    (62)99999-9999
${userAddress}    Goiania - GO
${userCountry}    Brazil
${sundayText}    Sunday
${mondayText}    Monday
${tuesdayText}    Tuesday
${wednesdayText}    Wednesday
${thursdayText}    Thursday
${fridayText}    Friday
${saturdayext}    Saturday
${targetDate}    12/25/2022
${userAmit}    Amit
${thirdBook}    Learn JS
${fourthBook}    Master In Selenium
${sixthBook}    Master In JS
${javascriptSubject}    Javascript
${fourthBookPrice}    3000
${color}    Green
${product4Name}    Product 4
${product4Price}    $7.99

*** Test Cases ***
Test Automation Practice using Robot Framework
    Open in Chrome Browser    ${url}
    
    # Validating header
    Page Should Contain Element    ${header}
    
    # Fill form
    Fill TAP Form    ${userName}    ${userEmail}    ${userPhone}    ${userAddress}

    # Selecting gender
    Select Female Gender on Form

    # Selecting Monday and Wednesday on list
    Select Day of List    ${mondayText}
    Select Day of List    ${wednesdayText}

    # Validating Days selection
    Validate Day of List is Not Checked    ${sundayText}
    Validate Day of List is Checked    ${mondayText}
    Validate Day of List is Not Checked    ${tuesdayText}
    Validate Day of List is Checked    ${wednesdayText}
    Validate Day of List is Not Checked    ${thursdayText}
    Validate Day of List is Not Checked    ${fridayText}
    Validate Day of List is Not Checked    ${saturdayext}

    # Selecting country
    Select Country    ${userCountry}

    # Selecting colors
    Select Color    ${color}

    # Select an date on calendar
    Select Date on Form    ${targetDate}

    # Validate Links
    Validate Form Links

    # Validate Author from given book

    # Validate Subject from given book

    # Validate Price from given book

    # Click on select by given product name

    # Validate Price from given product

    # Submit form and validate iframe
    Sleep    3s
    [Teardown]    Close Browser
