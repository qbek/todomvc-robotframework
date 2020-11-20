*** Variables ***
${BROWSER} =   chrome
${TODOMVC_URL} =     http://todomvc.com/examples/jquery/#/

*** Keywords ***
Set a TODO_NAME test variable
    Set test variable   ${TODO_NAME} [UAT] Learn RobotFramework

Set a FEW_TODO_NAMES test variable
    @{todos} =     Create list     [UAT] Learn RobotFramework     [UAT] Practice RobotFramework
    Set test variable     @{FEW_TODO_NAMES}    @{todos}