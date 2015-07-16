class CreateUserVaultRelationsTable < ActiveRecord::Migration
  def change
    create_table :user_vault_relations do |t|
      t.integer :user_id
      t.integer :vault_id
      t.timestamps
    end
  end
end
