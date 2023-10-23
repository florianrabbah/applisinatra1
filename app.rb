require 'sinatra'
require 'sinatra/activerecord'
require_relative './lib/gossip'

# Configuration de la base de données SQLite
set :database, { adapter: 'sqlite3', database: 'db/my_database.db' }

# Route pour afficher la liste des gossips
get '/' do
  @gossips = Gossip.all
  erb :index
end

# Route pour traiter les données soumises via le formulaire
post '/gossips' do
  author = params[:author]
  content = params[:content]

  # Enregistrez le gossip dans votre base de données
  Gossip.create(author: author, content: content)

  redirect '/'  # Redirigez l'utilisateur vers la liste des gossips après avoir soumis le formulaire
end
