class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.string :post_id
      t.string :integer

      t.timestamps
    end
  end
end
