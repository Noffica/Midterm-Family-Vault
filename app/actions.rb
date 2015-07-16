
# Retrieves the current_user object before each of these paths
['/user'].each do |path|
    before path do
        # The session[:current_user_id] is hard coded in configure for now
        session[:current_user_id] = 2
        @current_user = User.find(session[:current_user_id])
    end
end

# Homepage (Root path) (optional homepage before login)
get '/' do
  erb :index
end

get '/login' do
  erb :'login'
end

post '/login' do
  # binding.pry
  if logging_user = User.find_by(email: params[:email])
    # if params[:password] == logging_user.password 
      session[:current_user_id] = logging_user.id
      redirect to('/user')
  #   else
  #     erb :'login'
  #   end 
  # else
    erb :'login'
  end
end


# User page and setting user's vaults ===============================
# (gets photos & text from user's vaults)
get '/user' do
  @current_user.vault_ids.each do |id|
    @photo_posts = PhotoPost.where(vault_id: id)
    @text_posts = TextPost.where(vault_id: id)
  end
  erb :'user/index'
end

# (loads set vault form)
get '/user/user_vault/new' do
  erb :'user/user_vault/new'
end

# (submits form values to UserVaultRelations table)
post '/user/user_vault' do
  UserVaultRelation.create(
    user_id: session[:current_user_id], 
    vault_id: params[:vault_id])

  redirect '../user'
end


# Creating New Posts ===============================================
# (loads the submit page)
get '/user/photo_post/new' do
  erb :'user/photo_post/new'
end

# (posts the new content)
post '/user/photo_post' do
  PhotoPost.create(
    caption: params[:caption],
    file_path: params[:file_path],
    vault_id: params[:vault_id],
    user_id: session[:current_user_id])

  redirect '../user'
end

# (loads the submit page)
get '/user/text_post/new' do
  erb :'user/text_post/new'
end

# (posts the new content)
post '/user/text_post' do
  TextPost.create(
    title: params[:title],
    body: params[:body],
    valut_id: params[:vaut_id],
    user_id: session[:current_user_id])

  redirect '../user'
end


# Creating & Accessing Vaults =======================================
# (get vault creation form)
get '/vault/new' do
  erb :'vault/new'
end

# (submit vault, create in db)
post '/vault' do
  vault = Vault.create(
    name: params[:name],
    password: params[:password])

  # TO DO: Use callback instead in Vault class
  # sets the UserVaultRelation for the user and the created vault
  UserVaultRelation.create(
    user_id: session[:current_user_id], 
    vault: vault)

  redirect '/user'
end

# (loads a vault of a user that he/she has access to)
get '/vault/:id' do

  # To DO: Need to check if user has access!!
  @vault = Vault.find(params[:id])

  # if the vault id doesn't exist, give 404 not found error
  if @vault
    erb :'vault/index'
  else
    halt 404
  end
end


# Logout ==========================================================
get '/logout' do
  session.clear
  redirect '/'
end

