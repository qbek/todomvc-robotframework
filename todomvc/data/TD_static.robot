*** Keywords ***
Setup test variable TODO_NAME
    Set test variable    ${TODO_NAME}     Learn RobotFramework

Setup test variable TODOS_NAME
    @{todos} =    Create list     Learn RobotFramework    Practice RobotFramework     Master RobotFramework     Teach RobotFramework
    Set test variable    @{TODOS_NAME}       @{todos}