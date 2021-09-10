*** Test Cases ***
For loop
    @{list} =     Create list     html    php    java   c#    python
    FOR    ${el}     IN    @{list}
        Log to console     ${el}
        Log to console     ....
    END

