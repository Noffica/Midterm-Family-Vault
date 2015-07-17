
  puts "Seed data is added."
  user_1 = User.create!(name: "Fox McWolf", email: "fox@wolf.edu", password: "u")
  user_2 = User.create!(name: "Nemo", email: "nemo@nautilus.org", password: "u")
  user_3 = User.create!(name: "Frodo", email: "frodo@baggins.org", password: "u")
  user_4 = User.create!(name: "Samwise", email: "sam@gamgee.com", password: "u")
  user_5 = User.create!(name: "Meriadoc", email: "merry@brandybuck.net", password: "u")
  user_6 = User.create!(name: "Peregrin", email: "pippin@took.com", password: "u")
  user_7 = User.create!(name: "Aragorn", email: "aragorn@arathorn.com", password: "u")
  user_8 = User.create!(name: "Dude McGuy", email: "dude@mcguy.net", password: "u")
  user_9 = User.create!(name: "Legolas", email: "legolas@rivendell.org", password: "u")
  user_10 = User.create!(name: "Gimli", email: "gimli@gloin.net", password: "u")

  vault_1 = Vault.create!(name: "Family", password: "v")
  vault_2 = Vault.create!(name: "Midterm mates", password: "v")
  vault_3 = Vault.create!(name: "In-laws", password: "v")

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
