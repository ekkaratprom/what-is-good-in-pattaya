*** Variables ***
${URL}    http://localhost:4200/login

*** Keywords ***
Add New Employee
    [Arguments]    ${MESSAGE}    ${ADMIN_ID}    ${ADMIN_USER}    ${ACTION}    ${USER_ID}    ${FORM_ID}    ${NAME}    ${SURNAME}    ${TIMESTAMP}    ${DATE_OF_BIRTH}    ${POSITION}    ${PHONE_NUMBER}    ${ADDRESS}    ${START_DATE}    ${POST_CODE}    ${ID_CARD}
    Open Form Browser Using Google Chrome
    Click Login Button
    Change To Action Page
    Click Add Button
    Fill Employee's Info    ${USER_ID}    ${NAME}    ${SURNAME}    ${DATE_OF_BIRTH}    ${POSITION}    ${PHONE_NUMBER}    ${ADDRESS}    ${START_DATE}    ${MESSAGE}    ${POST_CODE}    ${ID_CARD}
    Click Submit Button
    Change To History Page    ${MESSAGE}    ${ADMIN_ID}    ${ADMIN_USER}    ${FORM_ID}    ${ACTION}    ${USER_ID}    ${NAME}    ${SURNAME}    ${TIMESTAMP}
    Close Form Browser

Edit Employee's Information
    [Arguments]    ${MESSAGE}    ${ADMIN_ID}    ${ADMIN_USER}    ${ACTION}    ${USER_ID}    ${FORM_ID}    ${NAME}    ${SURNAME}    ${TIMESTAMP}    ${DATE_OF_BIRTH}    ${POSITION}    ${PHONE_NUMBER}    ${ADDRESS}    ${START_DATE}    ${POST_CODE}    ${ID_CARD}
    Open Form Browser Using Google Chrome
    Click Login Button
    Change To Action Page
    Click Edit Button
    Check If Employee's Info Appears    ${USER_ID}    ${NAME}    ${ID_CARD}
    Edit Employee's Info    ${SURNAME}    ${MESSAGE}
    Click Save Button
    Change To History Page   ${MESSAGE}    ${ADMIN_ID}    ${ADMIN_USER}    ${FORM_ID}    ${ACTION}    ${USER_ID}    ${NAME}    ${SURNAME}    ${TIMESTAMP}
    Close Form Browser
    
Delete Employee's Information
    [Arguments]    ${MESSAGE}    ${ADMIN_ID}    ${ADMIN_USER}    ${ACTION}    ${USER_ID}    ${FORM_ID}    ${NAME}    ${SURNAME}    ${TIMESTAMP}    ${DATE_OF_BIRTH}    ${POSITION}    ${PHONE_NUMBER}    ${ADDRESS}    ${START_DATE}    ${POST_CODE}    ${ID_CARD}
    Open Form Browser Using Google Chrome
    Click Login Button
    Change To Action Page
    Click Delete Button
    Check If Employee's Info Appears    ${USER_ID}    ${NAME}    ${ID_CARD}
    Click Delete Button To Confirm
    Change To History Page    ${MESSAGE}    ${ADMIN_ID}    ${ADMIN_USER}    ${FORM_ID}    ${ACTION}    ${USER_ID}    ${NAME}    ${SURNAME}    ${TIMESTAMP}
    Close Form Browser

Open Form Browser Using Google Chrome
    Open Browser    ${URL}    chrome

Close Form Browser
    Close Browser

Click Login Button
    Click Button    id: login_btn

Change To Action Page
    Wait Until Page Contains Element    id: add_btn
    Wait Until Page Contains Element    id: edit_btn
    Wait Until Page Contains Element    id: delete_btn
    Wait Until Page Contains Element    id: history_btn

Click Add Button
    Click Button    id: add_btn

Fill Employee's Info
    [Arguments]    ${USER_ID}    ${NAME}    ${SURNAME}    ${DATE_OF_BIRTH}    ${POSITION}    ${PHONE_NUMBER}    ${ADDRESS}    ${START_DATE}    ${MESSAGE}    ${POST_CODE}    ${ID_CARD}
    Input Text    id: user_id    ${USER_ID}
    Input Text    id: firstname    ${NAME}
    Input Text    id: lastname    ${SURNAME}
    Input Text    id: id_card    ${ID_CARD}
    Input Text    id: date_of_birth    ${DATE_OF_BIRTH}
    Input Text    id: position    ${POSITION}
    Input Text    id: phone_number    ${PHONE_NUMBER}
    Input Text    id: address    ${ADDRESS}
    Input Text    id: post_code    ${POST_CODE}    
    Input Text    id: start_date    ${START_DATE}
    Input Text    id: message    ${MESSAGE}

Click Submit Button
    Click Button    id: submit_btn

Change To History Page
    [Arguments]    ${MESSAGE}    ${ADMIN_ID}    ${ADMIN_USER}    ${FORM_ID}    ${ACTION}    ${USER_ID}    ${NAME}    ${SURNAME}    ${TIMESTAMP}
    Table Should Contain    id: table_history    ${MESSAGE}
    # Wait Until Page Contains Element    id: table_history    
    Get Table Cell    id: table_history1    2    2    ${ADMIN_ID}  
    Get Table Cell    id: table_history1    2    3    ${ADMIN_USER}  
    Get Table Cell    id: table_history1    2    4    ${ACTION}
    Get Table Cell    id: table_history1    2    5    ${USER_ID}
    Get Table Cell    id: table_history1    2    6    ${NAME}
    Get Table Cell    id: table_history1    2    8    ${MESSAGE}

Click Edit Button
    Click Button    id: edit_btn

Check If Employee's Info Appears
    [Arguments]    ${USER_ID}    ${NAME}    ${ID_CARD}
    Wait Until Element Contains    id: user_id    ${USER_ID}
    Wait Until Element Contains    id: firstname    ${NAME} 
    Wait Until Element Contains    id: id_card    ${ID_CARD}

Edit Employee's Info
    [Arguments]    ${SURNAME}    ${MESSAGE}
    Clear Element Text    id: lastname    
    Input Text    id: lastname    ${SURNAME}
    Clear Element Text    id: message
    Input Text    id: message    ${MESSAGE}

Click Save Button
    Click Button    id: save_btn

Click Delete Button
    Click Button    id: delete_btn

Click Delete Button To Confirm
    Click Button    id: delete_btn