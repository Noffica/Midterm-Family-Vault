class UserVaultRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :vault

  # before_create :vault_exists?

  private
  # def vault_exists?
  #   errors.add(:no_vault,"No vault.") if !Vault.find_by(name: params[:name])
  # end

end
