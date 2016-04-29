class CreateInters < ActiveRecord::Migration
  def change
    create_table :inters do |t|
      t.float :global
      t.float :iclimate
      t.float :iquality
      t.integer :time

      t.timestamps null: false
    end
  end
end
