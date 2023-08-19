class CreateUpdateSkillHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :update_skill_histories do |t|
      t.integer :skill_level
      t.references :skill_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
