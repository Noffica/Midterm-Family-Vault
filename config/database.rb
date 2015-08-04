configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

# Setup a local PostgreSQL database
#   set :database, {
#     adapter: "postgresql",
#     database: "Family-Vault-development",
#     host: "localhost",
#     username: "development",
#     password: "development"
#   }

# # Setup a local SQLite3 database
#   set :database, {
#     adapter: "sqlite3",
#     database: "db/db.sqlite3"
#   }

if development?
  set :database, {
    adapter: "sqlite3",
    database: "db/db.sqlite3"
  }
else
  # set :database, ENV['DATABASE_URL']
end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
