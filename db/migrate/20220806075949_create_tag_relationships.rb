class CreateTagRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_relationships do |t|
      t.references :record, foreign_key: true, null: false
      t.references :tag,    foreign_key: true, null: false
      t.timestamps
    end
    add_index :tag_relationships, [:record_id,:tag_id],unique: true
  end
end
