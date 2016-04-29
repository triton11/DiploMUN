class CreateAmendments < ActiveRecord::Migration
  def change
    create_table :amendments do |t|
      t.string :title
      t.text :body
      t.string :sponsor
      t.references :resolution, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
