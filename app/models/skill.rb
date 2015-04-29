class Skill < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 30}
  validates :value, presence: true, numericality: {:greater_than => 9, :less_than => 101}
  validates :icon, presence: true
  belongs_to :character
  mount_uploader :icon, IconUploader
  validate :validates_value_divisibility_by_10 

  private

  def validates_value_divisibility_by_10
    if (value.to_i % 10 != 0)
    	errors.add(:value, "Your value need to be divisible by 10! Please try again.")
    end
  end
  plea
end
