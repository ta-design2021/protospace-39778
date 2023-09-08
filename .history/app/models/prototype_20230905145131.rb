class Prototype < ApplicationRecord
  belongs_to :user
  # MessagesテーブルとActive Storageのテーブルで管理された画像ファイルのアソシエーションをhas_one_attachedを記述。
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
