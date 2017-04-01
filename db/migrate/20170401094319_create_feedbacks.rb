class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :photo_id
      t.string :title
      t.integer :rating
      t.text :desc

      t.timestamps
    end
    add_index :feedbacks, [:photo_id, :user_id, :created_at]
  end
end
