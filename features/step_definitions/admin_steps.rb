Given(/^an admin$/) do
  @admin = FactoryGirl.build(:admin, email: "baki@baki.org", password: "bakibaki")
  @admin.save
end

When(/^there is an "(.*?)"$/) do |user|
  user = FactoryGirl.create(:user)
  user.save
end

When(/^there is an "(.*?)" of that user$/) do |character|
  character = FactoryGirl.create(:character)
  character.save
end

When(/^there is an "(.*?)" of that character$/) do |skill|
  skill = FactoryGirl.create(:skill)
  skill.save
end

# Login as admin

When(/^I visit welcome page$/) do
 visit root_path
end

When(/^I click on Users link$/) do
  click_link('Users')
end

When(/^I log in with my "(.*?)" and "(.*?)"$/) do |email, password|
  fill_in('Email', :with => 'baki@baki.org')
  fill_in('Password', :with => 'bakibaki')
  click_button('Log In')
end

Then(/^I am on the users page$/) do
  visit admins_users_path
end

# Showing User characters

Given(/^an Admin$/) do
 steps %{
    When I visit welcome page
    And I click on Users link
    And I log in with my "email" and "password"
    Then I am on the users page
 }
end

When(/^I click on show link$/) do
  click_link('Show')
end

Then(/^I am on the user page$/) do
  visit('/admins/users/1')
end

Then(/^I see character named "(.*?)"$/) do |text|
  page.should have_content(text)
end


# Showing character skills

Given(/^Admin on the users characters page$/) do
  steps %{
  	Given an Admin
    When I click on show link
    Then I am on the user page
    And I see character named "Warrior"
  }
end

When(/^I click on show button$/) do
  click_link('Show')
end

Then(/^I can see character skill named "(.*?)"$/) do |skill|
  page.should have_content(skill)
end
