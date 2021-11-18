*** Variables ***
${COUNTER} =    css:.todo-count strong


*** Keywords ***
Check if counter shows
    [Arguments]   ${expected}
    Element text should be     ${COUNTER}    ${expected}