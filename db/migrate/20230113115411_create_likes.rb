class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true
      t.timestamps
      # 同じユーザー・同じ投稿への「いいね！」が投稿できないようにDB側で制御
      t.index [:user_id, :record_id], unique: true
    end
  end
end
