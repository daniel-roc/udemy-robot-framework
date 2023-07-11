*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${user_name}               rahulshettyacademy
${valid_password}          learning
${invalid_password}        learningg    
${url}                     https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${url}

Close Browser session
    Close Browser
