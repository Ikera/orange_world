FactoryGirl.define do
  factory :character do
    name "Warrior" 
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app', 'assets', 'images','warrior.jpg')) }   
  end
end