*** Settings ***
Library    SeleniumLibrary
Test Setup    Load page
Test Teardown   Close page

*** Variables ***
${q1_answers} =    css:#question1 select
${q1_check_answert} =    css:#question1 button
${q2_answers} =    css:#question2 select
${q3_answers} =    css:#question3 select
${game_lost_alert} =     css:.alert-danger


${q1_wrong_answer} =   5
${q1_correct_answer} =    4

*** Test Cases ***
User can loose game
    Select from list by label    ${q1_answers}   ${q1_wrong_answer}
    Click element     ${q1_check_answert}
    Element should be visible    ${game_lost_alert}
    Element should not be visible    css:.alert-success
    Element text should be    css:.alert-danger    Niestety przegrałeś! Spróbuj jeszcze raz!

User can win game
    Select from list by label    css:#question1 select   4
    Click element     css:#question1 button

    Select from list by value    css:#question2 select   words-7
    Click element     css:#question2 button

    ${data-tip} =    Get element attribute   css:#question3 select    data-tip
    ${index} =    Evaluate   ${data-tip} - 1
    ${index_str} =    Convert to string    ${index}
    Select from list by index     css:#question3 select    ${index_str}
    Click element     css:#question3 button

    Element should be visible    css:.alert-success
    Element should not be visible    css:.alert-danger



*** Keywords ***
Load page
    Open browser    https://qbek.github.io/selenium-exercises/selects.html    firefox
    Maximize browser window
    Wait until page contains element    css:#question1

Close page
    Close borwser