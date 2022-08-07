class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy
  has_many :records, through: :tag_relationships

  validates :name_tag, uniqueness: true
end
