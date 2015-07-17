class User < ActiveRecord::Base
  
  has_many :user_vault_relations
  has_many :vaults, through: :user_vault_relations

  has_many :text_posts
  has_many :photo_posts

  validates           :name,
                      presence: true,
                      length: { maximum: 80 }

  validates           :password,
                      presence: true

  validates           :email,
                      uniqueness: true

  validates_format_of :email,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

end
