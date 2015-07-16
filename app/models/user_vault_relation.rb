class UserVaultRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :vault
end