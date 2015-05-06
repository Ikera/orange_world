require 'rails_helper'

describe User do

	it "Create User" do
	  user = FactoryGirl.build(:user)
	  expect(user).to be_valid
	end

	it{should belong_to(:admin)}
end