*** Settings ***
Resource  Objects/TodoInputField.robot
Resource  Objects/TodosList.robot

*** Variables ***
${todo-title} =  Learn RobotFramework
@{todo-titles} =  Learn RobotFramework  Practice RobotFramework  Master RobotFramewokr

*** Keywords ***
User creates new todo
    Add todo  ${todo-title}

User can see his todo is added to the list
    Todo list contains  ${todo-title}

User creates couple of todos
    Add todos  @{todo-titles}

User sees all his todos are added to the list
    Todo list contains all  @{todo-titles}

User sees correct count of remaining todos
