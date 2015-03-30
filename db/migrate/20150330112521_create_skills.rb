class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :value
      t.string :icon
      t.references :character, index: true

      t.timestamps null: false
    end
    add_foreign_key :skills, :characters
  end
end
