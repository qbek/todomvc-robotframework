


*** Keywords ***
Setup a todo-title test variable
    Set Test Variable    ${todo-title}    My first todo to complete


Setup a todo-titles test variable
    @{names} =     Create List    Learn RobotFramework    Practice RobotFramework    MasterRobotFramework
    Set Test Variable    @{todo-titles}    @{names}
