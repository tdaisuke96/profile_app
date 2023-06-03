class CreateSkillDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :skill_details do |t|
      t.string :skill_name
      t.integer :skill_level
      t.integer :skill_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
