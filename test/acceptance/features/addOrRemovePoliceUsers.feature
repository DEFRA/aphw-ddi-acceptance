Feature: Add or remove police users

    Scenario: Add one police user at a time
        Given I open the url "/"
        When I click on the link "Admin" 
        When I click on the link "Add or remove police officers"
        And I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Alan2.Koss1@cumbria.pnn.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "N" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I click on the element "button=Give access"
        Then I expect that element "h1" contains the text "You gave police officers access to the Index"
        And I expect that element "main" contains the text "alan2.koss1@cumbria.pnn.police.uk"

     Scenario: Add multiple police users at a time
        When I click on the link "Admin"
        And I click on the link "Add or remove police officers"
        And I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Timmothy1.Sainsbury2@cumbria.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Madalyn2.fish1@derbyshire.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Corine1.Dastardly2@devonandcornwall.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Anthony2.Blaa1@dorset.pnn.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Tyrique1_Bayliss2@dorset.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Luther2_Jones1@durham.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Else1_Knight2@dyfed-powys.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Lucius2_Dastardley1@essex.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Jermaine1_Matthew2@gloucestershire.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Maximus2.doe1@northants.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "N" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I click on the element "button=Give access"
        Then I expect that element "h1" contains the text "You gave police officers access to the Index"
        And I expect that element "main" contains the text "timmothy1.sainsbury2@cumbria.police.uk"
        And I expect that element "main" contains the text "madalyn2.fish1@derbyshire.police.uk"
        And I expect that element "main" contains the text "corine1.dastardly2@devonandcornwall.police.uk"
        And I expect that element "main" contains the text "anthony2.blaa1@dorset.pnn.police.uk"
        And I expect that element "main" contains the text "tyrique1_bayliss2@dorset.police.uk"
        And I expect that element "main" contains the text "luther2_jones1@durham.police.uk"
        And I expect that element "main" contains the text "else1_knight2@dyfed-powys.police.uk"        
        And I expect that element "main" contains the text "lucius2_dastardley1@essex.police.uk"
        And I expect that element "main" contains the text "jermaine1_matthew2@gloucestershire.police.uk"
        And I expect that element "main" contains the text "maximus2.doe1@northants.police.uk"

    Scenario: Remove police user
        When I click on the link "Admin"
        And I click on the link "Add or remove police officers"
        And I select the radio option with the value "remove" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Maximus2.doe1@northants.police.uk" to the inputfield "#pk"
        And I click on the element "button=Remove police officer"
        And I click on the element "button=Remove police officer"
        And I select the radio option with the value "Y" from the radio group "confirm"
        And I click on the element "button=Continue"
        Then I expect that element "h1" contains the text "You removed a police officer from the Index"
        And I expect that element "main" contains the text "maximus2.doe1@northants.police.uk"
        
    Scenario: Change/remove users in Add police users journey
        When I click on the link "Add or remove another police officer"
        And I select the radio option with the value "add" from the radio group "addOrRemove"
        And I click on the element "button=Continue"
        And I set "Maida1.Owner2@northumbria.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Carey2.Enstein1@notts.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Phyllis1.Brown2@south-wales.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Eleanora2.Daniel1@southyorkshire.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I select the radio option with the value "Y" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I set "Adell1_Weir2@staffordshire.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I click on the element "//dl/div[2]/dd[2]/ul/li[1]"
        And I clear the inputfield "#policeUser"
        And I set "Carrie2_Walsh1@wiltshire.police.uk" to the inputfield "#policeUser"
        And I click on the element "button=Add police officer"
        And I click on the element "//dl/div[3]/dd[2]/ul/li[2]"
        And I click on the element "//dl/div[4]/dd[2]/ul/li[2]"
        And I select the radio option with the value "N" from the radio group "addAnother"
        And I click on the element "button=Continue"
        And I click on the element "button=Give access"
        Then I expect that element "h1" contains the text "You gave police officers access to the Index"
        And I expect that element "main" contains the text "maida1.owner2@northumbria.police.uk"
        And I expect that element "main" contains the text "carrie2_walsh1@wiltshire.police.uk"
        And I expect that element "main" contains the text "eleanora2.daniel1@southyorkshire.police.uk"