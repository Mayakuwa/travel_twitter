class User < ApplicationRecord
  # uniquenessとは、重複を防ぐもの（同じemailがあってはならない）
  # もし、flashメッセージやエラーメッセージ、renderを表示せない場合は、routingerroとなる
  validates :email, {presence: true, uniqueness: true}
  validates :name, {presence: true}
  validates :password, {presence: true}

  # モデル内にインスタンスメゾットを定義すること可能
  # この場合のselfは、userを指す
  def posts
    return Post.where(user_id: self.id)
  end
end
