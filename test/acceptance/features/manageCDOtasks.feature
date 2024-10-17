Feature: Manage CDO tasks

Scenario:  Creating a new dog and owner
        Given I open the url "/"
        When I click on the link containing "Process new CDO or"
        And I set "Adam" to the inputfield "#firstName"
        And I set "Kent" to the inputfield "#lastName"
        And I click on the element "button=Continue"
        And I set "LS20 8BG" to the inputfield "#postcode"
        And I set "99" to the inputfield "#houseNumber"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm address"
        And I click on the link "I don’t have a microchip number"
        And I select the radio option with the value "XL Bully" from the radio group "breed"
        And I set "Bella" to the inputfield "#name"
        And I select the radio option with the value "cdo" from the radio group "applicationType"
        And I set "15" to the inputfield "#cdoIssued-day"
        And I set "07" to the inputfield "#cdoIssued-month"
        And I set "2024" to the inputfield "#cdoIssued-year"
        And I click on the element "button=Add dog details"
        And I click on the element "button=Confirm details"
        And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
        And I click on the element "#legislationOfficer"
        And I click on the element "button=Continue"
        And I click on the element "button=Confirm details"
        Then I expect that element "h1" contains the text "Record created" 

    Scenario: Search dog and navigate to manage cdo application
        When I click on the link "Home"
        And I click on the link "Search dog index"
        And I set "Bella" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Not yet started"
        And I expect that element "(//li)[4]" contains the text "Record insurance details"
        And I expect that element "(//li)[4]" contains the text "Cannot start yet"
        And I expect that element "(//li)[5]" contains the text "Record microchip number"
        And I expect that element "(//li)[5]" contains the text "Cannot start yet"
        And I expect that element "(//li)[6]" contains the text "Record application fee payment"
        And I expect that element "(//li)[6]" contains the text "Cannot start yet"
        And I expect that element "(//li)[7]" contains the text "Send Form 2"
        And I expect that element "(//li)[7]" contains the text "Cannot start yet"
        And I expect that element "(//li)[8]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[8]" contains the text "Cannot start yet"

    Scenario: Navigate to send application pack task
        When I click on the link "Send application pack"
        Then I expect that element "h1" contains the text "Send application pack"

    Scenario: Complete send application pack task
        When I click on the element "#taskDone"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Completed"
        And I expect that element "(//li)[4]" contains the text "Record insurance details"
        And I expect that element "(//li)[4]" contains the text "Not yet started"
        And I expect that element "(//li)[5]" contains the text "Record microchip number"
        And I expect that element "(//li)[5]" contains the text "Not yet started"
        And I expect that element "(//li)[6]" contains the text "Record application fee payment"
        And I expect that element "(//li)[6]" contains the text "Not yet started"
        And I expect that element "(//li)[7]" contains the text "Send Form 2"
        And I expect that element "(//li)[7]" contains the text "Not yet started"
        And I expect that element "(//li)[8]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[8]" contains the text "Cannot start yet"

    Scenario: Navigate to send form 2 task
        When I click on the link "Send Form 2"
        Then I expect that element "h1" contains the text "Send Form 2"

    Scenario: Complete send form 2 task
        When I click on the element "#taskDone"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Completed"
        And I expect that element "(//li)[4]" contains the text "Record insurance details"
        And I expect that element "(//li)[4]" contains the text "Not yet started"
        And I expect that element "(//li)[5]" contains the text "Record microchip number"
        And I expect that element "(//li)[5]" contains the text "Not yet started"
        And I expect that element "(//li)[6]" contains the text "Record application fee payment"
        And I expect that element "(//li)[6]" contains the text "Not yet started"
        And I expect that element "(//li)[7]" contains the text "Send Form 2"
        And I expect that element "(//li)[7]" contains the text "Completed"
        And I expect that element "(//li)[8]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[8]" contains the text "Not yet started"

    Scenario: Navigate to record insurance details task
        When I click on the link "Record insurance details"
        Then I expect that element "h1" contains the text "Record insurance details"

    Scenario: Complete record insurance details task
        When I select the option with the value "Dogs Trust" for element "#insuranceCompany"
        And I set "10" to the inputfield "#insuranceRenewal-day"
        And I set "03" to the inputfield "#insuranceRenewal-month"
        And I set "2026" to the inputfield "#insuranceRenewal-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Completed"
        And I expect that element "(//li)[4]" contains the text "Record insurance details"
        And I expect that element "(//li)[4]" contains the text "Completed"
        And I expect that element "(//li)[5]" contains the text "Record microchip number"
        And I expect that element "(//li)[5]" contains the text "Not yet started"
        And I expect that element "(//li)[6]" contains the text "Record application fee payment"
        And I expect that element "(//li)[6]" contains the text "Not yet started"
        And I expect that element "(//li)[7]" contains the text "Send Form 2"
        And I expect that element "(//li)[7]" contains the text "Completed"
        And I expect that element "(//li)[8]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[8]" contains the text "Not yet started"

    Scenario: Navigate to record microchip number task
        When I click on the link "Record microchip number"
        Then I expect that element "h1" contains the text "Record microchip number"

    Scenario: Complete record microchip number task
        When I set "123658965278569" to the inputfield "#microchipNumber"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Completed"
        And I expect that element "(//li)[4]" contains the text "Record insurance details"
        And I expect that element "(//li)[4]" contains the text "Completed"
        And I expect that element "(//li)[5]" contains the text "Record microchip number"
        And I expect that element "(//li)[5]" contains the text "Completed"
        And I expect that element "(//li)[6]" contains the text "Record application fee payment"
        And I expect that element "(//li)[6]" contains the text "Not yet started"
        And I expect that element "(//li)[7]" contains the text "Send Form 2"
        And I expect that element "(//li)[7]" contains the text "Completed"
        And I expect that element "(//li)[8]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[8]" contains the text "Not yet started"

    Scenario: Navigate to record application fee payment task
        When I click on the link "Record application fee payment"
        Then I expect that element "h1" contains the text "Record application fee payment"

    Scenario: Complete record application fee payment task
        When I set "10" to the inputfield "#applicationFeePaid-day"
        And I set "07" to the inputfield "#applicationFeePaid-month"
        And I set "2024" to the inputfield "#applicationFeePaid-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Completed"
        And I expect that element "(//li)[4]" contains the text "Record insurance details"
        And I expect that element "(//li)[4]" contains the text "Completed"
        And I expect that element "(//li)[5]" contains the text "Record microchip number"
        And I expect that element "(//li)[5]" contains the text "Completed"
        And I expect that element "(//li)[6]" contains the text "Record application fee payment"
        And I expect that element "(//li)[6]" contains the text "Completed"
        And I expect that element "(//li)[7]" contains the text "Send Form 2"
        And I expect that element "(//li)[7]" contains the text "Completed"
        And I expect that element "(//li)[8]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[8]" contains the text "Not yet started"

    Scenario: Navigate to record the verification date for microchip and neutering task
        When I click on the link "Record the verification date for microchip and neutering"
        Then I expect that element "h1" contains the text "Record the verification date for microchip and neutering"

    Scenario: Complete record the verification date for microchip and neutering task
        When I set "11" to the inputfield "#microchipVerification-day"
        And I set "07" to the inputfield "#microchipVerification-month"
        And I set "2024" to the inputfield "#microchipVerification-year"
        And I set "11" to the inputfield "#neuteringConfirmation-day"
        And I set "07" to the inputfield "#neuteringConfirmation-month"
        And I set "2024" to the inputfield "#neuteringConfirmation-year"
        And I click on the element "button=Save and continue"
        Then I expect that element "form" contains the text "Manage CDO application"
        And I expect that element "(//li)[3]" contains the text "Send application pack"
        And I expect that element "(//li)[3]" contains the text "Completed"
        And I expect that element "(//li)[4]" contains the text "Record insurance details"
        And I expect that element "(//li)[4]" contains the text "Completed"
        And I expect that element "(//li)[5]" contains the text "Record microchip number"
        And I expect that element "(//li)[5]" contains the text "Completed"
        And I expect that element "(//li)[6]" contains the text "Record application fee payment"
        And I expect that element "(//li)[6]" contains the text "Completed"
        And I expect that element "(//li)[7]" contains the text "Send Form 2"
        And I expect that element "(//li)[7]" contains the text "Completed"
        And I expect that element "(//li)[8]" contains the text "Record the verification date for microchip and neutering"
        And I expect that element "(//li)[8]" contains the text "Completed"
        And I expect that element "form" contains the text "Continue"

    Scenario: Navigate to generate certificate
        When I click on the link "Continue"  
        Then I expect that element "h1" contains the text "Generate a certificate of exemption"

    Scenario: Generate certificate
        When I click on the element "button=Generate certificate"

    Scenario:  Verify the status change from pre-exempt to exempt
        Given I open the url "/"    
        When I click on the link "Search dog index"
        And I set "Bella" to the inputfield "#searchTerms"
        And I press "Enter"
        And I click on the link containing "ED30"
        Then I expect that element "h1" contains the text "Dog ED30"
        And I expect that element "main" contains the text "Dog details"
        And I expect that element "(//dd)[6]" contains the text "123658965278569"
        And I expect that element "(//dd)[14]" contains the text "Exempt"
        And I expect that element "(//dd)[18]" contains the text "15 July 2024"
        And I expect that element "(//dd)[19]" contains the text "15 September 2024"
        And I expect that element "(//dd)[20]" contains the text "Northampton (Northampton Crown Court)"
        And I expect that element "(//dd)[21]" contains the text "West Yorkshire Police"
        And I expect that element "(//dd)[22]" contains the text "10 July 2024"
        And I expect that element "(//dd)[23]" contains the text "Dogs Trust"
        And I expect that element "(//dd)[24]" contains the text "10 March 2026"
        And I expect that element "(//dd)[25]" contains the text "11 July 2024"
        And I expect that element "(//dd)[26]" contains the text "11 July 2024"

    Scenario: Verify activity for dog
        When I click on the link "Check activity"
        Then I expect that element "tbody" contains the text "Dog record created (Applying for exemption)"
        And I expect that element "tbody" contains the text "Application pack sent"
        And I expect that element "tbody" contains the text "Form 2 sent"
        And I expect that element "tbody" contains the text "Insurance renewal date updated"
        And I expect that element "tbody" contains the text "Insurance company updated"
        And I expect that element "tbody" contains the text "Microchip number 1 updated"
        And I expect that element "tbody" contains the text "Application fee paid date updated"
        And I expect that element "tbody" contains the text "Microchip number verified updated"
        And I expect that element "tbody" contains the text "Neutering confirmed updated"
        And I expect that element "tbody" contains the text "Certificate issued"
        And I expect that element "tbody" contains the text "Dog status set to Exempt"