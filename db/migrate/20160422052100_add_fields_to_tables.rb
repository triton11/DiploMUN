class AddFieldsToTables < ActiveRecord::Migration
  def change
    add_column :resolution_countries, :country_id, :integer
    add_column :resolution_countries, :resolution_id, :integer
    add_column :resolution_countries, :source_id, :integer
  end
end
