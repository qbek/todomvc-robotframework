*** Settings ***
Resource    steps/User_steps.robot
Resource    data/test_data.robot
Test Teardown    User colses TodoMVC app

*** Variables ***
@{lista} =    a1     a4

*** Test Cases ***
User can create a new todo
    Set todo name for test    to jest moje zadanie
    User opens TodoMVC app
    User creates a new todo
    User verifies todo is created

User can create a few todos
    User opens TodoMVC app
    User creates a few todos
    User chekcs if all todos are created    



# User creates todo1
#     Set todo name for test    34908253
#     User opens TodoMVC app
#     User creates a specyfic todo 
#     User verifies specyfic todo is created 


# User creates todo2
#     Set todo name for test    adkls;gjadkls;gj l;sdkjf;aldskfj;klasdjf
#     User opens TodoMVC app
#     User creates a specyfic todo
#     User verifies specyfic todo is created
    
    