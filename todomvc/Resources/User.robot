*** Settings ***
Resource  Objects/TodoInputField.robot
Resource  Objects/TodosList.robot
Resource  Objects/TodoCounter.robot
Resource  Objects/Todo.robot
Resource  Objects/Panes.robot

Library    FakerLibrary

*** Variables ***
${todo-title} =  Learn RobotFramework

*** Keywords ***
User creates new todo
    Add todo    ${todo-title}

User can see his todo is added to the list
    Todo list contains todo    ${todo-title}

User creates couple of todos
    ${tc} =   Random Int     min=3   max=10
    @{sentences} =   Sentences    nb=${tc}
    Set Test Variable   @{todo-titles}    @{sentences}
    Add todos   @{todo-titles}


User sees all his todos are added to the list
    Todo list contains all todos    @{todo-titles}
    Capture Page Screenshot

User checks element index
    ${id} =   Get Todo Index    Practice RobotFramework
    Log    ${id}    console=True
    Delete Todo By Index     ${id}

User sees correct count of remaining todos
    ${counter} =   Get todos counter
    # this is quite smart solution
    # instead of remembering in test variable amount of randomly added todos
    # I'm just counting the number of <li> elements, which represents todo items
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
    ${count} =   Random Int     min=3   max=6
    @{sentences} =   Sentences    nb=${count}
    Add todos   @{sentences}


User adds "DELETE ME!!!" todo
    Add todo    DELETE ME!!!

User deletes "DELETE ME!!!" todo
    ${index} =    Get Todo Index    DELETE ME!!!
    Delete Todo By Index    ${index}

"DELETE ME!!!" no longer exists
    Todo list doesn't contain todo   DELETE ME!!!