class Job < ApplicationRecord
  belongs_to :company
  has_many :job_seekers
  has_many :seekers, through: :job_seekers
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
