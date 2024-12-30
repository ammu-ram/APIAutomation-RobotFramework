*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     Collections

*** Variables ***
${base_url}     https://gorest.co.in
${relative_url}     /public/v2/users/7483234
${bearer_token}     6efe93f3831c124eb8caf7e62ce03f33f3c36fcfe80b41056bf29c685239e41b
${content-type}     application/json

*** Test Cases ***
get particular_userdetail
        Create Session    mysession    ${base_url}
        ${headers}  Create Dictionary   Authorization=Bearer ${bearer_token}    Content-Type=${content-type}
        ${response}=    GET On Session  mysession   ${relative_url}     headers=${headers}
        Log To Console    ${response.status_code}
        Log To Console    ${response.content}