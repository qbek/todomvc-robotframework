*** Settings ***
Library    SeleniumLibrary

Test Setup     Load page
Test Teardown    Close browser

*** Variables ***
${PAGE} =    https://qbek.github.io/selenium-exercises/pl/selects.html
${BROWSER} =    firefox

${GAME_LOST_ALERT} =     css:.alert-danger
${GAME_WIN_ALERT} =     css:.alert-success

${Q1_ANSWERS_LIST} =     css:#question1 select
${Q1_ANSWER_WRONG} =    5
${Q1_ANSWER_CORRECT} =    4
${Q1_SUBMIT_ANSWER} =    css:#question1 button

${Q2_ANSWERS_LIST} =     css:#question2 select
${Q2_ANSWER_CORRECT} =    words-7
${Q2_SUBMIT_ANSWER} =    css:#question2 button

${Q3_ANSWERS_LIST} =     css:#question3 select
${Q3_SUBMIT_ANSWER} =    css:#question3 button

${SLEEP_TIME} =    2s

*** Test Cases ***
User can loose game
    Select from list by label    ${Q1_ANSWERS_LIST}     ${Q1_ANSWER_WRONG}
    Click element    ${Q1_SUBMIT_ANSWER}
    Element should be visible    ${GAME_LOST_ALERT}

User can win the game
    Select from list by label    ${Q1_ANSWERS_LIST}     ${Q1_ANSWER_CORRECT}
    Click element    ${Q1_SUBMIT_ANSWER}
    Sleep   ${SLEEP_TIME}

    Select from list by value    ${Q2_ANSWERS_LIST}     ${Q2_ANSWER_CORRECT}
    Click element    ${Q2_SUBMIT_ANSWER}
    Sleep    ${SLEEP_TIME}

    ${answer_q3} =    Get Element Attribute    ${Q3_ANSWERS_LIST}   data-tip
    ${answer_corrected} =   Evaluate    ${answer_q3} - 1
    ${answer_str} =    Convert to string   ${answer_corrected}
    Log    Zczytana wartość: ${answer_q3}    console=True
    Log    Poprawiona wartoś: ${answer_str}     console=True
    Select from list by index    ${Q3_ANSWERS_LIST}     ${answer_str}
    Click element    ${Q3_SUBMIT_ANSWER}
    Sleep   ${SLEEP_TIME}
    Element should be visible    ${GAME_WIN_ALERT}


*** Keywords ***
Load page
    Open browser     ${PAGE}    ${BROWSER}
    Maximize browser window