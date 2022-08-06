class TagRelationship < ApplicationRecord
  belongs_to :record
  belongs_to :tag
  # タグ付けのバリデーション・アソシエーション
  # validateをいれることで重複を防ぐ
  validates :record_id, presence: true
  validates :tag_id,    presence: true
end
