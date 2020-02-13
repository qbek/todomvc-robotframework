*** Settings ***
Library   SeleniumLibrary
Resource   pageobjects/create_todo_input.robot
Resource   ../testdata/${env}_env.robot


*** Variables ***
${BROWSER} =    firefox


*** Keywords ***
Start the app
    Open browser    ${APP_URL}    ${BROWSER}
    Maximize browser window
    Is create todo input displayed
