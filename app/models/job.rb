class Job < ApplicationRecord
  belongs_to :company
  has_many :job_seekers
  has_many :seekers, through: :job_seekers
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, :body, :tel, :email, :city, :block, presence: {message: '入力してください'}
  validates :prefecture_id, presence: {message: '選択してください'}
  validates :company_id, presence: true
end
