*** Settings ***
Resource    steps/User_steps.robot
Resource    data/test_data.robot
Test Teardown    User colses TodoMVC app

*** Test Cases ***
User can create a new todo
    Set todo name for test    to jest moje zadanie
    User opens TodoMVC app
    User creates a new todo
    User verifies todo is created


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
    
    