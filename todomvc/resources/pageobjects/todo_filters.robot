*** Variables ***
${ACTIVE_FILTER} =    css:.filters [href="#/active"]
${COMPLETED_FILTER} =    css:.filters [href="#/completed"]

*** Keywords ***
Switch to Active tab
    Click element    ${ACTIVE_FILTER}

Switch to Completed tab
    Click element    ${COMPLETED_FILTER}