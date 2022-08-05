class Record < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,   presence: true
  validates :title,   presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 200 }
  validates :height,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999}
  validates :weight,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999}
end
