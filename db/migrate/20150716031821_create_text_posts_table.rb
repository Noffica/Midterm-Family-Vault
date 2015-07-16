class CreateTextPostsTable < ActiveRecord::Migration
  def change
    create_table :text_posts do |t|
      t.string :title
      t.text :body
      t.integer :vault_id
      t.integer :user_id
      t.timestamps
    end
  end
end
