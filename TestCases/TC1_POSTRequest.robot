*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     Collections
Library     JSONLibrary

*** Variables ***
${base_url}     https://gorest.co.in
${relative_url}     /public/v2/users
${bearer_token}     6efe93f3831c124eb8caf7e62ce03f33f3c36fcfe80b41056bf29c685239e41b
${content_type}     application/json

*** Test Cases ***
post request_users
        ${header}   Create Dictionary   Content-Type=${content_type}    User-Agent=RobotFramework   Authorization=Bearer ${bearer_token}
        Create Session    mysession    ${base_url}
        ${response}=    POST On Session  mysession   ${relative_url}     data={"name":"Ammu Sriram A S", "email":"xyx@gmail.com", "gender":"female", "status":"active"}     headers=${header}
        Log To Console    ${response.status_code}
        Log To Console    ${response.content}
