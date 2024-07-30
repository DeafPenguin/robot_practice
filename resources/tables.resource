*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    commonKeywords.resource

*** Keywords ***
Get Table Headers
    [Arguments]    ${tableLocator}
    # Return table headers element
    ${headerElements}=    Get WebElements    ${tableLocator} th
    RETURN    ${headerElements}

Get Table Columns
    [Arguments]    ${tableLocator}
    # Store header element from table element 
    ${headerElements}=    Get Table Headers    ${tableLocator}

    # Create a collection enumerating them
    ${index}=    Set Variable    0
    ${columns}=    Create Dictionary
    FOR    ${element}    IN    @{headerElements}
        ${headerText}=    Get Text    ${element}
        Set To Dictionary    ${columns}    ${headerText}    ${index}
        ${index}=    Evaluate    ${index} + 1
    END

    # Return columns from table element
    RETURN    ${columns}

Get Rows by Column Value
# This Keyword still not working
    [Arguments]    ${tableLocator}    ${columnName}
    
    # Store columns from table element
    ${columns}=    Get Table Columns    ${tableLocator}

    # Get index of given column name
    ${columnIndex}=    Get From Dictionary    ${columns}    ${columnName}


    RETURN    ${columnIndex}