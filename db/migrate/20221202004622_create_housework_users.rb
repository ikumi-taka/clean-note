class CreateHouseworkUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :housework_users do |t|
      t.references :housework, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
