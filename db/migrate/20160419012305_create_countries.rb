class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.integer :resource
      t.integer :r_energy
      t.integer :n_energy
      t.integer :f_military
      t.integer :u_military
      t.integer :tech
      t.integer :education
      t.integer :infrastructure
      t.integer :funds
      t.integer :population
      t.float :economy
      t.float :quality
      t.float :happiness
      t.float :climate
      t.float :e_metric
      t.float :r_metric
      t.float :f_metric
      t.float :c_metric

      t.timestamps null: false
    end
  end
end
