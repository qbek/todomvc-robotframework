*** Settings ***
Library   SeleniumLibrary
Library   FakerLibrary
Resource    PageObjects/Todo_input.robot
Resource    PageObjects/Sections.robot
Resource    PageObjects/Todo_list.robot
Resource    PageObjects/Todo_counter.robot


*** Keywords ***
User opens ToDo application
#    Open Browser   ${APP_URL}    ${BROWSER}   remote_url=http://localhost:4444/wd/hub     desired_capabilities=name:${TEST_NAME},build:${BUILD_ID}
    Set Tags      ${BROWSER}
    Open Browser   ${APP_URL}    ${BROWSER}
    Wait for todo input

User adds a new todo
    Add todo    ${todo_name}

User adds "DELETE ME!" todo
    Add todo   DELETE ME!

User adds few todos
    ${todos_to_create} =    Random Int   min=2    max=5
    @{sentences} =   Sentences    nb=${todos_to_create}
    FOR   ${name}    IN    @{sentences}
        Add todo    ${name}
    END

A new todo is created
    List should contain todo    test

User completes created todo
    Complete todo

Todo is marked as completed
    Todo is completed

Todo is not listed on 'Active' section
    Switch to active section
    List should not contain todo    ${todo_name}

Todo is listed on 'Completed' section
    Switch to completed section
    List should contain todo    ${todo_name}

Todo is not listed
    List should not contain todo    ${todo_name}

Todo "DELETE ME!" is not listed
    List should not contain todo     DELETE ME!

Todo counter shows correct number of todos
    ${length} =    Get count of todos
    ${string} =    Convert To String    ${length}
    Counter shows    ${string}

User deletes created todo
    Delete todo

User deletes "DELETE ME!"
    ${index} =    Get index of todo    DELETE ME!
    Log To Console    ${index}
    Delete todo by index      ${index}