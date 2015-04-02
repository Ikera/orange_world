require 'rails_helper'

	describe Character do
	  it "has a name" do
	  character = Character.new(name: 'Warrior')
	  expect(character).to be_valid
	end
end