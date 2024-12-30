*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem

*** Variables ***
${base_url}     https://gorest.co.in/public/v2
${relative_url}     /posts

*** Test Cases ***
get requests_posts
        Create Session    mysession    ${base_url}
        ${response}=    GET On Session  mysession   ${relative_url}
        Log To Console    ${response.status_code}
        Log To Console    ${response.content}
        ${status}=      Convert To String    ${response.status_code}
        Should Be Equal    ${status}    200