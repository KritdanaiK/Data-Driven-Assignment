*** Settings ***
Library    DataDriver    file=testdata.csv    dialect=excel
Library    SeleniumLibrary
Test Template    Login

*** Variables ***
${url}    https://training-platform.doppio-tech.com/Login
${username_path}    //input[contains(@type, 'text')]
${password_path}    //input[contains(@type, 'password')]
${login_btn}    //button[contains(@type, 'submit')]
${msg}    //div[contains(@class, 'ant-modal-confirm-content')]

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}    ${expected_msg}
    Open Browser    ${url}    gc
    Input Text    ${username_path}    ${username}
    Input Text    ${password_path}    ${password}
    Click Button    ${login_btn}
    Wait Until Element Is Enabled    ${msg}
    Element Text Should Be    ${msg}    ${expected_msg}

*** Test Cases ***
test1