Feature: App has landing page

Scenario: Has landing page as root
 When user visit "root page"
 Then user will see text "Survey"

Scenario: Landing page has header
  When user visit "landing page"
  Then this page has element "header"

Scenario: landing page has main section
  When user visit "landing page"
  Then this page has element "main section"

Scenario: Landing page has registration form
  When user visit "landing page"
  Then this page has element "registration form"

Scenario: Landing page has how we can help you section
  When user visit "landing page"
  Then this page has element "how can we help you section"

Scenario: Landing page has testimonials section
  When user visit "landing page"
  Then this page has element "testimonials section"

Scenario: Landing page has footer
  When user visit "landing page"
  Then this page has element "footer"
