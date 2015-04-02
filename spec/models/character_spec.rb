require 'rails_helper'

describe Character do

    it "has a name" do
	  character = Character.new(name: 'Warrior')
	  expect(character).to be_valid
	end

	it "is invalid without a name" do
	  character = Character.new(name: nil)
	  character.valid?
	  expect(character.errors[:name]).to include("can't be blank")
	 end

	it "has a avatar" do
      character = Character.new(name: 'Warrior', 
  	  avatar: 'warrior.jpg')
      expect(character).to be_valid
    end
end