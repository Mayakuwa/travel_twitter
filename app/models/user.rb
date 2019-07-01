class User < ApplicationRecord
  # uniquenessとは、重複を防ぐもの（同じemailがあってはならない）
  # もし、flashメッセージやエラーメッセージ、renderを表示せない場合は、routingerroとなる
  validates :email, {presence: true, uniqueness: true}
  validates :name, {presence: true}
  validates :password, {presence: true}
end
