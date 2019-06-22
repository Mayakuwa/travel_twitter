class Post < ApplicationRecord
  #空の投稿を防ぐために、contentにpresence: trueを追加して、バリデーションにひっかかるようにする
  # 140字以上の文字数は投稿できないようにしている。
  validates :content, {presence: true, length: {maximum: 140}}
  
end
