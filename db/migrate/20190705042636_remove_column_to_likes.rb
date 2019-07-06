class RemoveColumnToLikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :integer, :string
  end
end
