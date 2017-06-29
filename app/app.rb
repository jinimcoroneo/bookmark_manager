ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './app/init'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/add' do
    erb :add
  end

  post '/links/add' do
    link = Link.new(title: params[:title], url: params[:url])
    tag1 = Tag.first_or_create(name: params[:tag1])
    link.tags << tag1
    tag2 = Tag.first_or_create(name: params[:tag2])
    link.tags << tag2
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @tag = Tag.first_or_create(name: params[:tag])
    @filtered_links = @tag ? @tag.links : []
    erb :tags
  end

  run! if app_file == $PROGRAM_NAME
end
