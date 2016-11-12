Feature: App has error pages
  In order to notify about inexistent pages
  User should see 404 page

  Scenario: Has 404 page
   When user visit "inexistent page"
   Then user will see text "Error 404"

  Scenario: Shows 404 page id route matches /404
    When user visit "404 page"
    Then user will see text "Error 404"

  Scenario: Shows 500 page id route matches /500
   When user visit "500 page"
   Then user will see text "Error 500"
