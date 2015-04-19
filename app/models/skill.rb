class Skill < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 30}
  validates :value, presence: true, numericality: {:greater_than => 9, :less_than => 101}	
  validates :icon, presence: true
  belongs_to :character
  mount_uploader :icon, IconUploader
end
