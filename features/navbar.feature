Feature: App has navbar
  In order to have navigation links
  Webpage should have a navbar

  Scenario: Header page has brand-logo
    When user visit "landing page"
    Then this page has element "brand logo"

  Scenario: User can select language selector
    When user visit "landing page"
    Then this page has element "language selector"

  Scenario: Not sutorized user can sign in

  Scenario: Signed in user can see link on surveys
