
# Retrieves the current_user object before each of these paths
['/user', '/user/text_post/new', '/user/photo_post/new', '/photoview'].each do |path|
    before path do
        # The session[:current_user_id] is hard coded in configure for now
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
      redirect '/user'
  #   else
  #     erb :'login'
  #   end 
  # else
    # erb :'login'
  end
end

get '/photoview' do
  erb :'photoview'
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
  @vault = Vault.find_by(name: params[:name])
  if @vault
    if params[:password] == @vault.password 

      UserVaultRelation.create(
        user_id: session[:current_user_id], 
        vault_id: @vault.id)

      redirect '../user'
    else
      erb :'/user/user_vault/new'
    end 
  else
    erb :'/user/user_vault/new'
  end  
end


# Creating New Posts ===============================================
# (loads the submit page)
get '/user/photo_post/new' do
  erb :'user/photo_post/new'
end

# (posts the new photo)
post '/user/photo_post' do
  #upload mechanism for photos. They are stored in the public images folder. 
  #creates a new photopost instance
  @photopost = PhotoPost.new(
    caption: params[:caption],
    file_path: params[:file_path],
    vault_id: params[:vault_id],
    user_id: session[:current_user_id])
  #if the post saves the user is redirected to their home page showing the new posts. 
  if @photopost.save
    redirect '../user'
  else
    erb :'/user/photo_post/new'
  end
end

# (loads the submit page)
get '/user/text_post/new' do
  erb :'user/text_post/new'
end

# (posts the new content)
post '/user/text_post' do
  @textpost = TextPost.new(
    title: params[:title],
    body: params[:body],
    vault_id: params[:vault_id],
    user_id: session[:current_user_id])
  if @textpost.save
    redirect '../user'
  else
    erb :'/user/text_post/new'
  end
end


# Creating & Accessing Vaults =======================================
# (get vault creation form)
get '/vault/new' do
  erb :'vault/new'
end

# (submit vault, create in db)
post '/vault' do
  @vault = Vault.new(
    name: params[:name],
    password: params[:password])

  # TO DO: Use callback instead in Vault class
  # sets the UserVaultRelation for the user and the created vault
  # UserVaultRelation.create(
  #   user_id: session[:current_user_id], 
  #   vault: @vault)
  if @vault.save
    redirect '/user'
  else
    erb :'vault/new'
  end

  
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

