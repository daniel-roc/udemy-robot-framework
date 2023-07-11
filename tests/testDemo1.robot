*** Settings ***
Documentation    To validade the Login Form
Library  SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}    id:name


*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it check and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://demoqa.com/login

Fill the login Form
    Input Text    id:userName    userName
    Input Password    id:password    Passwor
    Click Button    id:login

wait until it check and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Invalid username or password!