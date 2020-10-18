*** Settings ***
Resource  Objects/TodoInputField.robot
Resource  Objects/TodosList.robot
Resource  Objects/TodoCounter.robot
Resource  Objects/Todo.robot
Resource  Objects/Panes.robot
Resource  ../TestData/${TEST_DATA}TestData.robot

Library    FakerLibrary

*** Keywords ***
User creates new todo
    Setup a todo-title test variable
    Add todo    ${todo-title}

User can see his todo is added to the list
    Todo list contains todo    ${todo-title}

User creates couple of todos
    Setup a todo-titles test variable
    Add todos   @{todo-titles}


User sees all his todos are added to the list
    Todo list contains all todos    @{todo-titles}
    Capture Page Screenshot

User checks element index
    ${id} =   Get Todo Index    Practice RobotFramework
    Log    ${id}    console=True
    Delete Todo By Index     ${id}

# this is quite smart solution
# instead of remembering in test variable amount of randomly added todos
# I'm just counting the number of <li> elements, which represents todo items
User sees correct count of remaining todos
    ${counter} =   Get todos counter
    ${todos_count} =   Get count of todos
    Should Be Equal As Strings    ${counter}   ${todos_count}

User completes created todo
    Complete Todo    ${todo-title}


User switches to Active pane
    Switch to Active

User switches to Completed pane
    Switch to Completed

Todo is marked as completed
    Todo should be completed    ${todo-title}

Todo is not on list
    Todo list is empty

Todo is on list
    Todo list contains todo    ${todo-title}


User adds random number of todos
    User creates couple of todos


User adds "DELETE ME!!!" todo
    Add todo    DELETE ME!!!

User deletes "DELETE ME!!!" todo
    ${index} =    Get Todo Index    DELETE ME!!!
    Delete Todo By Index    ${index}

"DELETE ME!!!" no longer exists
    Todo list doesn't contain todo   DELETE ME!!!
