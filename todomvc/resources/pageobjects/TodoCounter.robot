*** Variables ***
${COUNTER} =      css:.todo-count strong


*** Keywords ***
Check if counter is
    [Arguments]    ${value}
    ${value_str} =     Convert to string    ${value}
    Element text should be    ${COUNTER}    ${value_str}