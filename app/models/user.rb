class User < ApplicationRecord
# 以下のバリデーションは、has_secure_passwordメゾットを指定することによって、不必要となる
# validates :password, {presence: true}
  has_secure_password
  # uniquenessとは、重複を防ぐもの（同じemailがあってはならない）
  # もし、flashメッセージやエラーメッセージ、renderを表示せない場合は、routingerrorとなる
  validates :email, {presence: true, uniqueness: true}
  validates :name, {presence: true}

  # モデル内にインスタンスメゾットを定義すること可能
  # この場合のselfは、userを指す
  def posts
    return Post.where(user_id: self.id)
  end
end
