class AddColorToVaults < ActiveRecord::Migration

  def change
    add_column :vaults, :color, :string
  end

end
