class CreateSkillDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :skill_details do |t|
      t.string :skill_name
      t.integer :skill_level
      t.references :user, null: false, foreign_key: true
      t.references :skill_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
