ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './app/init'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  
  
  get '/links' do
    @links = Link.all
    @users = User.all
    erb :links
  end
  
  get '/links/add' do
    erb :add
  end
  
  post '/links/add' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split(",").each do |tag|
      link.tags << Tag.first_or_create(name: tag.strip)
    end
    link.save
    redirect '/links'
  end
  
  get '/tags/:tag' do
    @tag = Tag.first_or_create(name: params[:tag])
    @filtered_links = @tag ? @tag.links : []
    erb :tags
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:email] = user.email
    redirect '/links'
  end
  
  helpers do
    def current_user
      @current_user = User.first(email: session[:email])
    end
  end
  
  run! if app_file == $PROGRAM_NAME
end
