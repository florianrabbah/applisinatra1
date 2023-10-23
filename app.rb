require 'sinatra'
require 'sinatra/activerecord'
require_relative './lib/gossip'

configure :development do
  set :database, YAML.load(File.read('config/database.yml'))['development']
end

# Route to display the list of gossips
get '/' do
  @gossips = Gossip.all
  erb :index
end



# Route to process the submitted form data
post '/gossips' do
  author = params[:author]
  content = params[:content]

  # app.rb
get '/gossips' do
  @gossips = db.execute('SELECT * FROM gossips')
  erb :gossips
end


   # Enregistrez le gossip dans votre base de données
   Gossip.create(author: author, content: content)

  redirect '/'  # Redirect the user to the list of gossips after submitting the form
end

