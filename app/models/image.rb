class Image < ApplicationRecord
  belongs_to :job
  mount_uploader :image, ImageUploader
  validates :image, presence: {message: '画像がありません'}, on: [:create, :update, :edit]
end
