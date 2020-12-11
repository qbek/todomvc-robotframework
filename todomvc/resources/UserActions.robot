*** Settings ***
Resource   TestDataGenerator.robot
Resource   pageobjects/TodoCreateInput.robot
Resource   pageobjects/TodosList.robot
Resource   pageobjects/FilterTabs.robot
Resource   pageobjects/TodoMVCApp.robot

*** Keywords ***
User opens TodoMVC app
    Open TodoMVC application
    Wait for application is ready

User creates a new todo
    Create todo    ${TODO_NAME}

User checks if todo is created
    Verify todo is on the list    ${TODO_NAME}

User completes the todo
    Complete todo    ${TODO_NAME}

User checks if todo is marked as completed
    Verify if todo is marked as completed    ${TODO_NAME}

User checks if completed todo is NOT on 'Active' tab
    Go to Active tab
    Verify todo is NOT on the list    ${TODO_NAME}

User checks if completed todo is on 'Completed' tab
    Go to Completed tab
    Verify todo is on the list    ${TODO_NAME}

User creates a few todos
    Generate random todo names
    FOR    ${todo}    IN    @{TODO_NAMES}
        Create todo    ${todo}
    END

User checks if all todos are created
    FOR    ${todo}    IN    @{TODO_NAMES}
        Verify todo is on the list    ${todo}
    END

User creates THE ONE
    Create todo    THE ONE

User completes THE ONE
    Complete todo    THE ONE

User checks if THE ONE is completed
    Verify if todo is marked as completed     THE ONE
