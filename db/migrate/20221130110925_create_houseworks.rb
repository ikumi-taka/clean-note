class CreateHouseworks < ActiveRecord::Migration[6.0]
  def change
    create_table :houseworks do |t|
      t.string :image
      t.string :housework_name, null: false
      t.string :type
      t.string :buy_date
      t.string :name, null: false
      t.timestamps
    end
  end
end