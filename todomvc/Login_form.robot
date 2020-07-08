*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${GOTO_SING_UP} =  css:[data-ui-test="signUp"]
${EMAIL} =   css:[data-ui-test="userMail"]
${PASSWORD} =   css:[data-ui-test="userPassword"]
${PASSWORD_REPAT} =   css:[data-ui-test="userPasswordConfirm"]
${SING_UP} =   css:[data-ui-test="signUpButton"]


*** Test Cases ***
Login
  Open Browser    http://localhost:4000/selenium-exercises/layouts/version_A/showcase.html
  Set Selenium Speed    1 second
  Click Element   ${GOTO_SING_UP}
  Input Text    ${EMAIL}    wp@wp.pl
  Input Text    ${PASSWORD}   pass
  Input Text    ${PASSWORD_REPAT}   pass
  Click Element   ${SING_UP}
