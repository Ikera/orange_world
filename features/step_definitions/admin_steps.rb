Given(/^an admin$/) do
  @admin = FactoryGirl.build(:admin, email: "baki@baki.org", password: "bakibaki")
  @admin.save
end

When(/^I visit welcome page$/) do
 visit root_path
end

When(/^I click on Users link$/) do
  click_link('Users')
end

When(/^I log in with my "(.*?)" and "(.*?)"$/) do |email, password|
  fill_in('Email', :with => 'baki@lbaki.org')
  fill_in('Password', :with => 'bakibaki')
  click_button('Log In')
end

Then(/^I am on the users page$/) do
  visit admins_users_path
end

When(/^I click on show button$/) do
  click_button('Show')
end

