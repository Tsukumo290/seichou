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

  def save_tags(saverecord_tags)
    current_tags = self.tags.pluck(:name_tag) unless self.tags.nil?
    old_tags = current_tags - saverecord_tags
    new_tags = saverecord_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name_tag: old_name)
    end

    saverecord_tags.each do |new_name|
    record_tag = Tag.find_or_create_by(name_tag: new_name)
    self.tags << record_tag
    end
  end
end
