class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  # コマンドでrails generate migration add_password_digest_to_hoges password_digest:stringと、
  # 語尾にhogesを追加することによって、hogesテーブルにカラムを追加するマイグレーションとなる
  def change
    add_column :users, :password_digest, :string
  # 以下の変更内容は、自分で書いたやつ
   remove_column :users, :password, :string
  end
end
