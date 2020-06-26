*** Settings ***
Library    Dialogs
Test Teardown     Close browser
Resource     resources/User_actions.robot
Resource     resources/pageobjects/Todos_counter.robot
Resource    testdata/${ENV}_env.robot

*** Test Cases ***
Semi automatic test
  User opens todoMVC application
  Execute Manual Step    Please enter few todos
  ${count} =    Get Value From User    How many todos have you created?
  Check if counter shows value    ${count}
