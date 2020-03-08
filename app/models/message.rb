class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presence: true, unless: :image?
# 前半のvalidates :content, presence: trueは、contentカラムが空の場合は保存しない、というバリデーションです。
# 後半で、unless: :image?という条件を追加しています。unlessはifの逆の役割があります。
# if: :image?であれば、imageカラムが空でなければという意味になりますので、unless: :image?はimageカラムが空だったらという意味です。
# つまり、imageカラムが空の場合、contentカラムも空であれば保存しないという意味になります。

mount_uploader :image, ImageUploader
# アップローダーを作成したら、Messageモデルを編集しimage_uploaderをマウントする記述を行います。
end
