class Record < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 10 }
    validates :content, length: { maximum: 200 }
  end
  validates :height, allow_blank: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999}
  validates :weight, allow_blank: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999}
end
