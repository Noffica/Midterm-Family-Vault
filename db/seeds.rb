
  puts "Seed data is added."
  user_1  = User.create!(name: "Luke Skywalker",  email: "luke@jedi.com",          password: "u")
  user_2  = User.create!(name: "Jean-Luc Picard", email: "captain@enterprise.com", password: "u")
  user_3  = User.create!(name: "Leia Organa",     email: "leia@rebel.org",         password: "u")
  # user_4  = User.create!(name: "Samwise",    email: "sam@gamgee.com",        password: "u")
  # user_5  = User.create!(name: "Meriadoc",   email: "merry@brandybuck.net",  password: "u")
  # user_6  = User.create!(name: "Peregrin",   email: "pippin@took.com",       password: "u")
  # user_7  = User.create!(name: "Aragorn",    email: "aragorn@arathorn.com",  password: "u")
  # user_8  = User.create!(name: "Dude McGuy", email: "dude@mcguy.net",        password: "u")
  # user_9  = User.create!(name: "Legolas",    email: "legolas@rivendell.org", password: "u")
  # user_10 = User.create!(name: "Gimli",      email: "gimli@gloin.net",       password: "u")

  vault_1 = Vault.create!(name: "My Family",          password: "v", color: "blue")
  vault_2 = Vault.create!(name: "Enterprise Family",  password: "v", color: "orange")
  vault_3 = Vault.create!(name: "I love my Family",   password: "v", color: "green")

  UserVaultRelation.create!(user: user_1, vault: vault_1)
  UserVaultRelation.create!(user: user_2, vault: vault_2)
  UserVaultRelation.create!(user: user_3, vault: vault_3)

  # UserVaultRelation.create!(user: user_1, vault: vault_2)
  # UserVaultRelation.create!(user: user_3, vault: vault_2)
  # UserVaultRelation.create!(user: user_4, vault: vault_2)
  # UserVaultRelation.create!(user: user_5, vault: vault_2)

  # UserVaultRelation.create!(user: user_1, vault: vault_3)
  # UserVaultRelation.create!(user: user_5, vault: vault_3)
  # UserVaultRelation.create!(user: user_6, vault: vault_3)
  # UserVaultRelation.create!(user: user_7, vault: vault_3)
