  puts "Seed data is added."
  user_1 = User.create!(name: "Fox McWolf", email: "fox@wolf.edu")
  user_2 = User.create!(name: "Nemo", email: "nemo@nautilus.org")
  user_3 = User.create!(name: "Frodo", email: "frodo@baggins.org")
  user_4 = User.create!(name: "Samwise", email: "sam@gamgee.com")
  user_5 = User.create!(name: "Meriadoc", email: "merry@brandybuck.net")
  user_6 = User.create!(name: "Peregrin", email: "pippin@took.com")
  user_7 = User.create!(name: "Aragorn", email: "aragorn@arathorn.com")
  user_8 = User.create!(name: "Dude McGuy", email: "dude@mcguy.net")
  user_9 = User.create!(name: "Legolas", email: "legolas@rivendell.org")
  user_10 = User.create!(name: "Gimli", email: "gimli@gloin.net")

  vault_1 = Vault.create!(name: "Family", password: "a")
  vault_2 = Vault.create!(name: "Midterm mates", password: "a")
  vault_3 = Vault.create!(name: "In-laws", password: "a")

  UserVaultRelation.create!(user: user_1, vault: vault_1)
  UserVaultRelation.create!(user: user_2, vault: vault_1)
  UserVaultRelation.create!(user: user_3, vault: vault_1)

  UserVaultRelation.create!(user: user_1, vault: vault_2)
  UserVaultRelation.create!(user: user_3, vault: vault_2)
  UserVaultRelation.create!(user: user_4, vault: vault_2)
  UserVaultRelation.create!(user: user_5, vault: vault_2)

  UserVaultRelation.create!(user: user_1, vault: vault_3)
  UserVaultRelation.create!(user: user_5, vault: vault_3)
  UserVaultRelation.create!(user: user_6, vault: vault_3)
  UserVaultRelation.create!(user: user_7, vault: vault_3)