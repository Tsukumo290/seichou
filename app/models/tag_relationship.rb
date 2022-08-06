class TagRelationship < ApplicationRecord
  belongs_to :record
  belongs_to :tag

end
