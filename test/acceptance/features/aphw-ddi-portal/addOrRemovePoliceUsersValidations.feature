Feature: Add or remove police users validations

    Scenario: Select Add or remove option
        Given I open the url "/"
        When I click on the link "Admin" 
        And I click on the link "Add or remove police officers"
        And I click on the element "button=Continue"
        Then I expect that element "form" contains the text "Select an option"

    Scenario: Enter a police user's email address during add user 
        When I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I click on the element "button=Add police officer"
        Then I expect that element "form" contains the text "Enter a police officer's email address"

    Scenario: Add existing police user already on allow list
        When I set "Alan2.Koss1@cumbria.pnn.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        Then I expect that element "form" contains the text "This police officer already has access"

    Scenario: Add police user with invalid email format
        When I set "Carrie2_Walsh1.wiltshire" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        Then I expect that element "form" contains the text "Enter a police officer's email address"

    Scenario: Adding same police user which is already added in this session
        When I set "Laila1Louis2@thamesvalley.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Laila1Louis2@thamesvalley.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        Then I expect that element "form" contains the text "This police officer's details have already been entered"

    Scenario: Enter a police user's email address during remove user 
        Given I open the url "/"
        When I click on the link "Admin" 
        And I click on the link "Add or remove police officers"
        And I select the radio option with the value "remove" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I click on the element "button=Remove police officer"
        Then I expect that element "form" contains the text "Enter the police officer's email address"