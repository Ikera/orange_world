require 'rails_helper'

describe Admin do

	it "Create Admin" do
	  admin = FactoryGirl.build(:admin)
	  expect(admin).to be_valid
	end

	it{should have_many(:users)}
end
