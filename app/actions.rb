# Retrieves the current_user object before each of these paths
helpers do
  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end
end

# Homepage (Root path) (optional homepage before login)
get '/' do
  redirect 'login'
end

get '/login' do
  erb :'login', :layout => false
end

post '/login' do
  # binding.pry
  if logging_user = User.find_by(email: params[:email])
    if params[:password] == logging_user.password 
      session[:current_user_id] = logging_user.id
      redirect '/user'
    else
      erb :'login'
    end 
  else
    erb :'login'
  end
end

get '/photo_view' do
  #Below logic to replace the /user route logic for sorting. 
  @photo_posts = []
  @text_posts = []
  @all_posts = []

  current_user.vault_ids.each do |id|
    @photo_posts += (PhotoPost.where(vault_id: id))
    @text_posts += (TextPost.where(vault_id: id))
  end
  @all_posts = @text_posts.concat @photo_posts
  erb :'photo_view'
end

# User page and setting user's vaults ===============================
# (gets photos & text from user's vaults)
get '/user' do

  @photo_posts = []
  @text_posts = []
  @all_posts = []

  current_user.vault_ids.each do |id|
    @photo_posts += (PhotoPost.where(vault_id: id))
    @text_posts += (TextPost.where(vault_id: id))
  end

  @all_posts = @text_posts.concat @photo_posts
  erb :'user/index'
end

# (loads set vault form)
get '/user/user_vault/new' do
  erb :'user/user_vault/new'
end

# (submits form values to UserVaultRelations table)
post '/user/user_vault' do
  # If the Vault Name input field is blank, render the erb and show the relevant error.
  if !params[:name] || params[:name].empty?
    @vault_name_blank = true
    erb :'/user/user_vault/new'
  # If the Vault Name input field receives valid input, go further
  else
    @vault = Vault.find_by(name: params[:name])
    # If the `@vault` exists, go further.
    if @vault
      @existing_user_vault_relation = UserVaultRelation.where(vault_id: @vault.id).where(user_id: session[:current_user_id])
      # If the @existing_user_vault_relation does *not* exist (the user does not already belong to the vault), go further.
      if @existing_user_vault_relation.empty?
        # If the Invitation Code matches the vault password, go further.
        if params[:password] == @vault.password
          @new_user_vault_relation = UserVaultRelation.create(
            user_id:  session[:current_user_id],
            vault_id: @vault.id
          )
          redirect '../user'
        # If the Invitation Code does not match the vault password, render the erb with the error.
        else
          @invitation_code_incorrect = true
          erb :'/user/user_vault/new'
        end
      # If the @existing_user_vault_relation exists (the user already belongs to the vault).
      else
        erb :'/user/user_vault/new'
      end
    # If the `@vault` does *not* exist.
    else
      @vault_does_not_exist = true
      erb :'/user/user_vault/new'
    end
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
    user_id: current_user.id)
  #if the post saves the user is redirected to their home page showing the new posts. 
  # binding.pry
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
    password: params[:password],
    color: params[:color]
    )
  # TO DO: Use callback instead in Vault class
  # sets the UserVaultRelation for the user and the created vault
  if @vault.save
    UserVaultRelation.create(
    user_id: session[:current_user_id], 
    vault: @vault)

    redirect '/user'
  else
    erb :'vault/new'
  end

  
end

# (loads a vault of a user that he/she has access to)
# To DO: Need to check if user has access!!
get '/vault/:id' do

  @photo_posts = []
  @text_posts = []
  @all_posts = []

  @vault = Vault.find(params[:id])
  @photo_posts += (PhotoPost.where(vault_id: params[:id]))
  @text_posts += (TextPost.where(vault_id: params[:id]))
  @all_posts = @text_posts.concat @photo_posts

  # if the vault id doesn't exist, give 404 not found error
  if @vault
    erb :'vault/index', :layout => false
  else
    halt 404
  end
end


# Logout ==========================================================
get '/logout' do
  session.clear
  redirect '/'
end

