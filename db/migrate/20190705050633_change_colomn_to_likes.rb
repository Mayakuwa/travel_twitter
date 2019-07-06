class ChangeColomnToLikes < ActiveRecord::Migration[5.0]

  # 変更内容
  def up
    change_column :likes, :post_id, :integer
  end

  # 変更前の状態
  def down
    change_column :likes, :post_id, :varchar
  end

end
