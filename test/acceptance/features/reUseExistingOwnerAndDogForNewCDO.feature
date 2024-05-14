Feature: Reuse existing owner and dog for new application
 
   Scenario: Enter existing owner details
      Given I open the url "/"
      When I click on the link containing "Process new CDO or"
      And I set "John" to the inputfield "#firstName"
      And I set "Smith" to the inputfield "#lastName"
      And I click on the element "button=Continue"
      Then I expect that element "h1" contains the text "Select the address for John Smith"

   Scenario: Select existing owner address and Confirm existing dog details
      When I select the radio option with the value "0" from the radio group "address"
      And I click on the element "button=Continue"
      Then I expect that element "h1" contains the text "Select the dog for John Smith"
         
   Scenario: Select existing dog details
      When I select the radio option with the value "0" from the radio group "dog"
      And I click on the element "button=Continue"
      Then I expect that element "h1" contains the text "Application type"

   Scenario: Select CDO and confirm all details
      When I select the radio option with the value "cdo" from the radio group "applicationType"
      And I set "01" to the inputfield "#cdoIssued-day"
      And I set "02" to the inputfield "#cdoIssued-month"
      And I set "2024" to the inputfield "#cdoIssued-year"  
      And I click on the element "button=Continue"
      And I set "Northampton (Northampton Crown Court)" to the inputfield "#court"
      And I set "James" to the inputfield "#legislationOfficer"
      And I click on the element "button=Continue"
      Then I expect that element "h1" contains the text "Confirm all details"
      And I expect that element "(//dd)[1]" contains the text "John Smith"
      And I expect that element "(//dd)[3]" not contains any text
      And I expect that element "(//dd)[5]" contains the text "LS20 8DA"
      And I expect that element "(//dd)[7]" contains the text "England"
      And I expect that element "(//dd)[8]" contains the text "West Yorkshire Police"
      And I expect that element "(//dd)[9]" contains the text "James"
      And I expect that element "(//dd)[10]" contains the text "Northampton (Northampton Crown Court)"
      And I expect that element "(//dd)[11]" contains the text "XL Bully"
      And I expect that element "(//dd)[12]" contains the text "Fido"
      And I expect that element "(//dd)[13]" contains the text "345677654312333"
      And I expect that element "(//dd)[14]" contains the text "01 February 2024"
      And I expect that element "(//dd)[15]" contains the text "01 April 2024"
      And I expect that element "(//dd)[16]" contains the text "ED3"

   Scenario: New application created successfully for existing owner and existing dog
      When I click on the element "button=Confirm details"
      Then I expect that element "h1" contains the text "Record created" 
      And I expect that element "(//dd)[1]" contains the text "XL Bully"
      And I expect that element "(//dd)[2]" contains the text "Fido"
      And I expect that element "(//dd)[3]" contains the text "345677654312333"
      And I expect that element "(//dd)[4]" contains the text "01 February 2024"
      And I expect that element "(//dd)[5]" contains the text "01 April 2024"
      And I expect that element "(//dd)[6]" contains the text "John Smith"
      And I expect that element "(//dd)[7]" contains the text "LS20 8DA"
      And I expect that element "(//dd)[8]" contains the text "England"
      And I expect that element "(//dd)[9]" contains the text "Northampton (Northampton Crown Court)"  
      And I expect that element "(//dd)[10]" contains the text "West Yorkshire Police"  
      And I expect that element "(//dd)[11]" contains the text "James" 

   Scenario: Verify dog exemption details updated successfully
      Given I open the url "/"
      When I click on the link "Search dog index"
      And I set "Fido" to the inputfield "#searchTerms"
      And I press "Enter"
      And I click on the link containing "ED30"
      Then I expect that element "h1" contains the text "Dog ED30"
      And I expect that element "(//dd)[1]" contains the text "Fido"
      And I expect that element "(//dd)[2]" contains the text "XL Bully"
      And I expect that element "(//dd)[3]" contains the text "Not entered"
      And I expect that element "(//dd)[4]" contains the text "Not entered"
      And I expect that element "(//dd)[5]" contains the text "Not entered"
      And I expect that element "(//dd)[6]" contains the text "345677654312333"
      And I expect that element "(//dd)[7]" contains the text "John Smith"
      And I expect that element "(//dd)[8]" contains the text "Not entered"
      And I expect that element "(//dd)[9]" contains the text "LS20 8DA" 
      And I expect that element "(//dd)[11]" contains the text "Not entered"
      And I expect that element "(//dd)[12]" contains the text "Not entered"  
      And I expect that element "(//dd)[13]" contains the text "England" 
      And I expect that element "(//dd)[14]" contains the text "Pre-exempt"
      And I expect that element "(//dd)[16]" contains the text "Not entered" 
      And I expect that element "(//dd)[17]" contains the text "01 February 2024"
      And I expect that element "(//dd)[18]" contains the text "01 April 2024"
      And I expect that element "(//dd)[19]" contains the text "Northampton (Northampton Crown Court)"              
      And I expect that element "(//dd)[20]" contains the text "West Yorkshire Police" 
      And I expect that element "(//dd)[21]" contains the text "James" 
      And I expect that element "(//dd)[22]" contains the text "Not entered" 
      And I expect that element "(//dd)[23]" contains the text "Not entered" 
      And I expect that element "(//dd)[24]" contains the text "Not entered" 
      And I expect that element "(//dd)[25]" contains the text "Not entered" 
      And I expect that element "(//dd)[26]" contains the text "Not entered" 





