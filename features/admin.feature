Feature: Admin
  
  Scenario: Login as admin
    Given an admin
    When I visit welcome page
    And I click on Users link
    And I log in with my "email" and "password"
    Then I am on the users page
    When I click on show button
    Then I can see all users characters
 