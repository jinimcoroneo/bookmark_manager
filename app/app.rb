require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/add' do
    erb :add
  end

  post '/links/add' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  run! if app_file == $PROGRAM_NAME
end