*** Settings ***
Library    DataDriver    file=testdata.csv    dialect=excel
Library    SeleniumLibrary
Test Template    Login

*** Variables ***
${url}    https://training-platform.doppio-tech.com/Login
${username_path}    //div[div[label[@title='Username']]]//input
${password_path}    //div[div[label[@title='Password']]]//input
${login_btn}    //button[span[text()='Login']]
${msg}    //div[@class='ant-modal-confirm-content']

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