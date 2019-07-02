class Post < ApplicationRecord
  # モデル内にインスタンスメゾットを定義すること可能
  # 空の投稿を防ぐために、contentにpresence: trueを追加して、バリデーションにひっかかるようにする
  # 140字以上の文字数は投稿できないようにしている。
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}

  # ユーザーインスタンスを定義
  # selfはそのインスタンス自身。この場合のselfはpost
  # これを元に、postコントローラーのshowを書き直す
  def user
    return User.find_by(id: self.user_id)
  end
end
