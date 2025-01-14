Feature: Change owner(new owner already exists on the index)

        Scenario:  Creating a new dog and owner
                Given I open the url "/"
                When I click on the link containing "Process new CDO or"
                And I set "James" to the inputfield "#firstName"
                And I set "Terry" to the inputfield "#lastName"
                And I set "01" to the inputfield "#dateOfBirth-day"
                And I set "06" to the inputfield "#dateOfBirth-month"
                And I set "1990" to the inputfield "#dateOfBirth-year"
                And I click on the element "button=Continue"
                And I set "M25 1HR" to the inputfield "#postcode"
                And I set "8" to the inputfield "#houseNumber"
                And I click on the element "button=Continue"
                And I click on the element "button=Confirm address"
                And I set "345671185691113" to the inputfield "#microchipNumber"
                And I click on the element "button=Continue"
                And I select the radio option with the value "XL Bully" from the radio group "breed"
                And I set "Lobo" to the inputfield "#name"
                And I select the radio option with the value "cdo" from the radio group "applicationType"
                And I set "28" to the inputfield "#cdoIssued-day"
                And I set "05" to the inputfield "#cdoIssued-month"
                And I set "2024" to the inputfield "#cdoIssued-year"
                And I click on the element "button=Add dog details"
                And I click on the element "button=Confirm details"
                And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
                And I click on the element "#legislationOfficer"
                And I click on the element "button=Continue"
                And I click on the element "button=Confirm details"
                Then I expect that element "h1" contains the text "Record created"

        Scenario: Edit Exemption details
                Given I open the url "/"
                When I click on the link "Search dog index"
                And I set "Lobo" to the inputfield "#searchTerms"
                And I press "Enter"
                And I click on the link containing "ED30"
                And I click on the link "Dog record"
                And I click on the element "(//a[contains(text(),'Edit details')])[2]"
                And I set "29" to the inputfield "#certificateIssued-day"
                And I set "05" to the inputfield "#certificateIssued-month"
                And I set "2024" to the inputfield "#certificateIssued-year"
                And I select the option with the value "Warwickshire Police" for element "#policeForce"
                And I set "Declan" to the inputfield "#legislationOfficer"
                And I set "29" to the inputfield "#applicationFeePaid-day"
                And I set "05" to the inputfield "#applicationFeePaid-month"
                And I set "2024" to the inputfield "#applicationFeePaid-year"
                And I select the option with the value "Dogs Trust" for element "#insuranceCompany"
                And I set "29" to the inputfield "#insuranceRenewal-day"
                And I set "05" to the inputfield "#insuranceRenewal-month"
                And I set "2026" to the inputfield "#insuranceRenewal-year"
                And I set "29" to the inputfield "#neuteringConfirmation-day"
                And I set "05" to the inputfield "#neuteringConfirmation-month"
                And I set "2024" to the inputfield "#neuteringConfirmation-year"
                And I set "29" to the inputfield "#microchipVerification-day"
                And I set "05" to the inputfield "#microchipVerification-month"
                And I set "2024" to the inputfield "#microchipVerification-year"
                And I click on the element "button=Save details" 
                Then I expect that element "h1" contains the text "Dog ED30"
                And I expect that element "(//dd)[14]" contains the text "Exempt"
                And I expect that element "(//dd)[16]" contains the text "29 May 2024"
                And I expect that element "(//dd)[18]" contains the text "2015"
                And I expect that element "(//dd)[19]" contains the text "28 May 2024"
                And I expect that element "(//dd)[20]" contains the text "28 July 2024"
                And I expect that element "(//dd)[21]" contains the text "Not entered"
                And I expect that element "(//dd)[22]" contains the text "Northampton (Northampton Crown Court)"
                And I expect that element "(//dd)[23]" contains the text "Warwickshire Police"
                And I expect that element "(//dd)[24]" contains the text "Declan"
                And I expect that element "(//dd)[25]" contains the text "29 May 2024"
                And I expect that element "(//dd)[26]" contains the text "Dogs Trust"
                And I expect that element "(//dd)[27]" contains the text "29 May 2026"
                And I expect that element "(//dd)[28]" contains the text "29 May 2024"
                And I expect that element "(//dd)[29]" contains the text "29 May 2024"     
        
        Scenario: Process cdo  for a dog(submit microchip number that is on a dog of another owner)
                Given I open the url "/"
                When I click on the link containing "Process new CDO or"
                And I set "Tim" to the inputfield "#firstName"
                And I set "Ricketts" to the inputfield "#lastName"
                And I set "01" to the inputfield "#dateOfBirth-day"
                And I set "12" to the inputfield "#dateOfBirth-month"
                And I set "1988" to the inputfield "#dateOfBirth-year"
                And I click on the element "button=Continue"
                And I select the radio option with the value "0" from the radio group "address"
                And I click on the element "button=Continue"
                And I select the radio option with the value "-1" from the radio group "dog"
                And I click on the element "button=Continue"
                And I set "345671185691113" to the inputfield "#microchipNumber"
                And I click on the element "button=Continue"
                Then I expect that element "h1" contains the text "Microchip number 345671185691113"
                And  I expect that element "form" contains the text "Do you want to make Tim Ricketts the dog owner"

        Scenario: Confirm change of owner
                When I select the radio option with the value "Y" from the radio group "confirm"
                And I click on the element "button=Continue"
                Then I expect that element "h1" contains the text "Application type"

        Scenario: Select CDO and confirm all details
                When I select the radio option with the value "cdo" from the radio group "applicationType"
                And I set "29" to the inputfield "#cdoIssued-day"
                And I set "05" to the inputfield "#cdoIssued-month"
                And I set "2024" to the inputfield "#cdoIssued-year"  
                And I click on the element "button=Continue"
                And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
                And I set "Lucy" to the inputfield "#legislationOfficer"
                And I click on the element "button=Continue"
                Then I expect that element "h1" contains the text "Confirm all details"
                And I expect that element "(//dd)[1]" contains the text "Tim Ricketts"
                And I expect that element "(//dd)[2]" contains the text "01 December 1988"
                And I expect that element "(//dd)[3]" contains the text "ST7 2BS"
                And I expect that element "(//dd)[4]" contains the text "England"
                And I expect that element "(//dd)[5]" contains the text "Cheshire Constabulary"
                And I expect that element "(//dd)[6]" contains the text "Lucy"
                And I expect that element "(//dd)[7]" contains the text "Northampton (Northampton Crown Court)"
                And I expect that element "(//dd)[8]" contains the text "XL Bully"
                And I expect that element "(//dd)[9]" contains the text "Lobo"
                And I expect that element "(//dd)[10]" contains the text "345671185691113"
                And I expect that element "(//dd)[11]" contains the text "29 May 2024"
                And I expect that element "(//dd)[12]" contains the text "29 July 2024"
                And I expect that element "(//dd)[13]" contains the text "ED3"

        Scenario: New application created successfully for an existing owner and existing dog
                When I click on the element "button=Confirm details"
                Then I expect that element "h1" contains the text "Record created" 
                And I expect that element "(//dd)[1]" contains the text "XL Bully"
                And I expect that element "(//dd)[2]" contains the text "Lobo"
                And I expect that element "(//dd)[3]" contains the text "345671185691113"
                And I expect that element "(//dd)[4]" contains the text "29 May 2024"
                And I expect that element "(//dd)[5]" contains the text "29 July 2024"
                And I expect that element "(//dd)[6]" contains the text "Tim Ricketts"
                And I expect that element "(//dd)[7]" contains the text "01 December 1988"
                And I expect that element "(//dd)[8]" contains the text "ST7 2BS"
                And I expect that element "(//dd)[9]" contains the text "England"
                And I expect that element "(//dd)[10]" contains the text "Cheshire Constabulary"
                And I expect that element "(//dd)[11]" contains the text "Lucy"
                And I expect that element "(//dd)[12]" contains the text "Northampton (Northampton Crown Court)"


        Scenario: Verify dog is moved to existing owner and exemption details updated successfully
                Given I open the url "/"
                When I click on the link "Search dog index"
                And I set "Lobo" to the inputfield "#searchTerms"
                And I press "Enter"
                And I click on the link containing "ED30"
                And I click on the link "Dog record"
                Then I expect that element "h1" contains the text "Dog ED30"
                And I expect that element "(//dd)[1]" contains the text "Lobo"
                And I expect that element "(//dd)[2]" contains the text "XL Bully"
                And I expect that element "(//dd)[3]" contains the text "Not entered"
                And I expect that element "(//dd)[4]" contains the text "Not entered"
                And I expect that element "(//dd)[5]" contains the text "Not entered"
                And I expect that element "(//dd)[6]" contains the text "345671185691113"
                And I expect that element "(//dd)[7]" contains the text "Tim Ricketts"
                And I expect that element "(//dd)[8]" contains the text "01 December 1988"
                And I expect that element "(//dd)[9]" contains the text "ST7 2BS" 
                And I expect that element "(//dd)[11]" contains the text "Not entered"
                And I expect that element "(//dd)[12]" contains the text "Not entered"  
                And I expect that element "(//dd)[13]" contains the text "England" 
                And I expect that element "(//dd)[14]" contains the text "Applying for exemption"
                And I expect that element "(//dd)[16]" contains the text "Not entered"
                And I expect that element "(//dd)[17]" contains the text "2015" 
                And I expect that element "(//dd)[18]" contains the text "29 May 2024"
                And I expect that element "(//dd)[19]" contains the text "29 July 2024"
                And I expect that element "(//dd)[20]" contains the text "Not entered"
                And I expect that element "(//dd)[21]" contains the text "Northampton (Northampton Crown Court)"              
                And I expect that element "(//dd)[22]" contains the text "Cheshire Constabulary" 
                And I expect that element "(//dd)[23]" contains the text "Lucy" 
                And I expect that element "(//dd)[24]" contains the text "Not entered" 
                And I expect that element "(//dd)[25]" contains the text "Dogs Trust" 
                And I expect that element "(//dd)[26]" contains the text "29 May 2026" 
                And I expect that element "(//dd)[27]" contains the text "Not entered" 
                And I expect that element "(//dd)[28]" contains the text "Not entered"         