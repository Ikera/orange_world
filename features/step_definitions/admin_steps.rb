Given(/^an admin$/) do
  FactoryGirl.create(:character)
end

When(/^I visit welcome page$/) do
 visit root_path
end

When(/^I click on Admin link$/) do
  click_link('Admin')
end

When(/^I log in with my "(.*?)" and "(.*?)"$/) do |email, password|
  fill_in('Email', :with => 'baki@lbaki.org')
  fill_in('Password', :with => 'bakibaki')
  click_button('Log In')
end

When(/^I click on Users link$/) do
  click_link('Users')
end

Then(/^I am on the users page$/) do
  visit admins_users_path
end