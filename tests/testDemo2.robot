*** Settings ***
Documentation    To validade the Login Form
Library  SeleniumLibrary
Test Setup        open the browser with the Mortgage payment url
Test Teardown    Close Browser session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link

*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form    ${user_name}    ${invalid_password}
    wait until Element is located in the page    ${Error_Message_Login}
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login Form    ${user_name}    ${valid_password}
    wait until Element is located in the page    ${Shop_page_load}
    Verify Card titles in the Shop Page


*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

wait until Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the Shop Page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get WebElements    .card-title
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        
    END