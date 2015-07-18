class Vault < ActiveRecord::Base
  has_many :user_vault_relations
  has_many :users, through: :user_vault_relations

  has_many :text_posts
  has_many :photo_posts

  validates   :name,
              presence:   true,
              uniqueness: true

  validates   :password,
              presence: true

  # after_create :assign_user_to_vault


  # private
  #   def assign_user_to_vault
  #     UserVaultRelation.create(
  #     user_id: current_user.id, 
  #     vault: self)
  #   end 
end
