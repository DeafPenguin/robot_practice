*** Settings ***
Library    SeleniumLibrary
Resource    selectors.resource

*** Keywords ***
Page Should Contain Element
    [Arguments]    ${element}
    Element Should Be Visible    ${element}

Open in Chrome Browser
    [Arguments]    ${address}
    Open Browser    ${address}    chrome
    Maximize Browser Window

Fill TAP Form
    [Arguments]    ${userName}    ${userEmail}    ${userPhone}    ${userAddress}
    Input Text    ${nameInput}    ${userName}
    Input Text    ${emailInput}    ${userEmail}
    Input Text    ${phoneInput}    ${userPhone}
    Input Text    ${addressInput}    ${userAddress}