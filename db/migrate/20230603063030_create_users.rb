class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.text :self_introduction
      t.binary :profile_image
      t.timestamps
    end
  end
end
