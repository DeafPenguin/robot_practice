*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${datePickerMonthText}    class=ui-datepicker-month
${datePickerYearText}    class=ui-datepicker-year
${previousMonthButton}    class=ui-datepicker-prev
${nextMonthButton}    class=ui-datepicker-next

&{monthsMap}    01=January    02=February    03=March    04=April    05=May    06=June    07=July    08=August    09=September    10=October    11=November    12=December    

*** Keywords ***
Open Datepicker
    [Arguments]    ${dateFieldLocator}
    Click Element    ${dateFieldLocator}

Click Next Month Button
    Click Element    ${nextMonthButton}

Click Previous Month Button
    Click Element    ${previousMonthButton}

Select Day
    [Arguments]    ${day}
    ${dayLocator}=    Set Variable   //a[text()="${day}"]
    Click Element    ${dayLocator}

Navigate To Month Year
    [Arguments]    ${month}    ${year}
    ${targetMonth}=    Set Variable    ${monthsMap}[${month}]
    ${targetYear}=    Set Variable    ${year}
    ${targetMonthIndex}=    Evaluate    list(${monthsMap}.values()).index('${targetMonth}') + 1

    FOR    ${i}    IN RANGE    100
        ${currentMonth}=    Get Text    ${datePickerMonthText}
        ${currentYear}=    Get Text    ${datePickerYearText}
        ${currentMonthIndex}=    Evaluate    list(${monthsMap}.values()).index('${currentMonth}') + 1

        Run Keyword If    ('${currentMonth}' == '${targetMonth}') and ('${currentYear}' == '${targetYear}')    Exit For Loop
        Run Keyword If    int(${currentYear}) > int(${targetYear}) or (int(${currentYear}) == int(${targetYear}) and int(${currentMonthIndex}) > int(${targetMonthIndex}))   Click Previous Month Button    ELSE    Click Next Month Button
    END

Select Date
    [Arguments]    ${dateFieldLocator}    ${date}

    ${convertedDate}=    Split String    ${date}    /
    ${month}=    Set Variable    ${convertedDate}[0]
    ${day}=    Set Variable    ${convertedDate}[1]
    ${year}=    Set Variable    ${convertedDate}[2]
    
    Open Datepicker    ${dateFieldLocator}
    Navigate To Month Year    ${month}    ${year}
    Select Day    ${day}