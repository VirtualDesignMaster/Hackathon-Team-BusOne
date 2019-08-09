class CreateUserSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :user_skills do |t|
      t.integer :user_id
      t.integer :skill_id
      t.string :proficiency
      t.integer :years

      t.timestamps
    end
  end
end
