class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string     :title,   null: false
      t.text       :content, null: false
      t.integer    :height
      t.integer    :weight
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
