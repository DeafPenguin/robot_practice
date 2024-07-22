*** Settings ***
Library    SeleniumLibrary
Resource    resources/selectors.resource
Resource    resources/keywords.resource

*** Test Cases ***
Test Automation Practice using Robot Framework
    Open in Chrome Browser    ${url}
    Page Should Contain Element    ${header}
    Fill TAP Form    Victor    victormurilo@gmail.com    62000000000    Testando campo de escrita
    [Teardown]    Close Browser