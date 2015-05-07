Feature: Admin

  Background:
    Given an admin
    And there is an "user"
    And there is an "character" of that user
    And there is an "skill" of that character
  
  @javascript
  Scenario: Login as admin 
    Given I visit welcome page
    And I click on Users link
    And I log in with my "email" and "password"
    Then I am on the users page

  @javascript
  Scenario: Showing User characters
    Given an Admin
    When I click on show link
    Then I am on the user page
    And I see character named "Warrior"
    
  @javascript
  Scenario: Showing character skills
    Given Admin on the users characters page
    When I click on show button
    Then I can see character skill named "Intellect"
 