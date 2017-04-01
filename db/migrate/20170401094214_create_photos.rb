class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :title
      t.string :rating

      t.timestamps
    end
    add_index :photos, [:user_id, :created_at]
  end
end
