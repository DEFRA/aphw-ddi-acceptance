Feature: Manage activities lists

    Scenario: Navigate to admin area
        Given I open the url "/"
        When I click on the link "Admin"
        Then I expect that element "h1" contains the text "Admin area"

    Scenario: Click on dog record send activity    
        When I click on the link "Activities"
        And I click on the element "(//a[contains(text(),'Add an activity')])[1]"
        Then I expect that element "h1" contains the text "What is the name of the activity you want to add?"

     Scenario: Add dog record send activity
        When I set "A dog record send test activity" to the inputfield "#activity" 
        And I click on the element "button=Add activity"
        Then I expect that element "h1" contains the text "Are you sure you want to add ‘A dog record send test activity’ to the activity list?"

    Scenario: Confirm dog record send activity added
        When I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You added A dog record send test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "(//dl)[1]" contains the text "A dog record send test activity"

    Scenario: Add dog record send activity with the same name which already exists
        When I click on the element "(//a[contains(text(),'Add an activity')])[1]"  
        And I set "A dog record send test activity" to the inputfield "#activity" 
        And I click on the element "button=Add activity"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "This activity name is already in the Index"        

    Scenario: Add dog record receive activity  
        When I click on the link "Admin"
        And I click on the link "Activities" 
        And I click on the element "(//a[contains(text(),'Add an activity')])[2]"  
        And I set "A dog record receive test activity" to the inputfield "#activity" 
        And I click on the element "button=Add activity"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You added A dog record receive test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "(//dl)[2]" contains the text "A dog record receive test activity"

    Scenario: Add dog record receive activity with the same name which already exists
        When I click on the element "(//a[contains(text(),'Add an activity')])[2]"  
        And I set "A dog record receive test activity" to the inputfield "#activity" 
        And I click on the element "button=Add activity"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "This activity name is already in the Index"
        
    Scenario: Add owner record send activity 
        When I click on the link "Admin"
        And I click on the link "Activities"
        And I click on the element "(//a[contains(text(),'Add an activity')])[3]"  
        And I set "An owner record send test activity" to the inputfield "#activity"
        And I click on the element "button=Add activity"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You added An owner record send test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "(//dl)[3]" contains the text "An owner record send test activity"

    Scenario: Add owner record send activity with the same name which already exists
        When I click on the element "(//a[contains(text(),'Add an activity')])[3]"  
        And I set "An owner record send test activity" to the inputfield "#activity" 
        And I click on the element "button=Add activity"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "This activity name is already in the Index"

    Scenario: Add owner record receive activity 
        When I click on the link "Admin"
        And I click on the link "Activities"
        And I click on the element "(//a[contains(text(),'Add an activity')])[4]"  
        And I set "An owner record receive test activity" to the inputfield "#activity"
        And I click on the element "button=Add activity"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You added An owner record receive test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "(//dl)[4]" contains the text "An owner record receive test activity"

    Scenario: Add owner record receive activity with the same name which already exists
        When I click on the element "(//a[contains(text(),'Add an activity')])[4]"  
        And I set "An owner record receive test activity" to the inputfield "#activity" 
        And I click on the element "button=Add activity"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "main" contains the text "This activity name is already in the Index"
            
    Scenario: Remove dog record send activity 
        When I click on the link "Admin"
        And I click on the link "Activities"
        And I click on the element "(//dl)[1]/div[1]/dd[2]/a[1]"  
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You removed A dog record send test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "(//dl)[1]" not contains the text "A dog record send test activity"    

    Scenario: Remove dog record receive activity 
        When I click on the element "(//dl)[2]/div[1]/dd[2]/a[1]"  
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You removed A dog record receive test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "(//dl)[2]" not contains the text "A dog record receive test activity"

    Scenario: Remove owner record send activity 
        When I click on the element "(//dl)[3]/div[1]/dd[2]/a[1]"  
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You removed An owner record send test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "(//dl)[3]" not contains the text "An owner record send test activity"

    Scenario: Remove owner record receive activity 
        When I click on the element "(//dl)[4]/div[1]/dd[2]/a[1]"  
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You removed An owner record receive test activity"
        And I click on the link containing "Manage activity lists"
        And I expect that element "main" not contains the text "An owner record receive test activity"
