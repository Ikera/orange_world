Feature: Admin

  @javascript
  Scenario: Login as admin
    Given an admin
    When I visit welcome page
    And I click on Admin link
    And I log in with my "email" and "password"
    And I click on Users link
    Then I am on the users page