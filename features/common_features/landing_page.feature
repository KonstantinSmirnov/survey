Feature: App has landing page
 
Scenario: Has landing page as root        
 Given User visit "root page"
 Then User will see text "Survey"
 
Scenario: Landing page has brand-logo
  Given User visit "landing page"
  Then User will see text "Survey"