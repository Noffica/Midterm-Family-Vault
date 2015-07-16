class CreatePhotoPostsTable < ActiveRecord::Migration
  def change
    create_table :photo_posts do |t|
      t.string :caption
      t.string :file_path
      t.integer :vault_id
      t.integer :user_id
      t.timestamps
    end
  end
end
