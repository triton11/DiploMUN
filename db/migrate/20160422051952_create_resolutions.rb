class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.string :name
      t.string :topic
      t.text :body

      t.timestamps null: false
    end
  end
end
