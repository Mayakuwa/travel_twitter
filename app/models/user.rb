class User < ApplicationRecord
  # uniquenessとは、重複を防ぐもの（同じemailがあってはならない）
  validates :email, {presence: true, uniqueness: true}
  validates :name, {presence: true}

end
