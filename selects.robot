*** Settings ***
Library    SeleniumLibrary
Test Setup     Open page
Test Teardown    Close browser

*** Variables ***
${QUESTION_1} =    css:#question1 select
${SUBMIT_ANSWER_1} =     css:#question1 button
${QUESTION_1_ANSWER} =   4

${QUESTION_2} =    css:#question2 select
${SUBMIT_ANSWER_2} =     css:#question2 button
${QUESTION_2_ANSWER} =   words-7

${QUESTION_3} =    css:#question3 select
${SUBMIT_ANSWER_3} =     css:#question3 button
${QUESTION_3_ANSWER} =   ???


*** Test Cases ***
User can loose game
    Select from list by label    css:#question1 select     5
    Click element    css:#question1 button
    Element should be visible    css:.alert-danger
    Close browser

User can win game
    Set Selenium Speed    1s
    Select from list by label    ${QUESTION_1}     ${QUESTION_1_ANSWER}
    Click element    ${SUBMIT_ANSWER_1}

    Select from list by value    ${QUESTION_2}    ${QUESTION_2_ANSWER}
    Click element    ${SUBMIT_ANSWER_2}

    ${data-tip} =   Get element attribute    ${QUESTION_3}    data-tip
    ${index} =     Evaluate    ${data-tip} - 1
    ${index_str} =   Convert to string    ${index}

    Select from list by index    ${QUESTION_3}    ${index_str}
    Click element    ${SUBMIT_ANSWER_3}

    Element should be visible    css:.alert-success

*** Keywords ***
Open page
    Open browser    https://qbek.github.io/selenium-exercises/selects.html    firefox
    Maximize browser window
