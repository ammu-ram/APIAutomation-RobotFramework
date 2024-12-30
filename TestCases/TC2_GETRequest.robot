*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem


*** Variables ***
${base_url}     https://gorest.co.in/public/v2
${relative_url}     /todos

*** Test Cases ***
get request_todos
        Create Session    mysession   ${base_url}
        ${response}=    GET On Session      mysession   ${relative_url}
        ${status_code}=     Convert To String    ${response.status_code}
        Log To Console    ${status_code}
        Log To Console    ${response.content}
        Should Be Equal    ${status_code}    200