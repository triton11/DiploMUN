class CreateResolutionCountries < ActiveRecord::Migration
  def change
    create_table :resolution_countries do |t|

      t.timestamps null: false
    end
  end
end
