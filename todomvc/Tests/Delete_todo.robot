*** Settings ***
Documentation  This test has a challenge! We need to delete "DELETE ME!" todo,
...            but we don't know exact loaction of this element
...            so we need to traverse all todos to find correct one

Resource  ../Resources/User.robot
Resource  ../Resources/Setup.robot

Test Setup  Open TodoMVC
Test Teardown  Close TodoMVC


*** Test Case ***
User can delete todo
    User adds random number of todos
    User adds "DELETE ME!!!" todo
    User adds random number of todos
    User deletes "DELETE ME!!!" todo
    "DELETE ME!!!" no longer exists
