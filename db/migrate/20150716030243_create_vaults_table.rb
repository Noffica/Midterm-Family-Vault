class CreateVaultsTable < ActiveRecord::Migration
  def change
    create_table :vaults do |t|
      t.string :name
      t.string :password
      t.timestamps
    end
  end
end
