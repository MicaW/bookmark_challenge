ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  DataMapper::Logger.new($stdout, :debug)

  get '/' do
     redirect '/links'
   end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(title: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb:'links/index'
  end

  post '/tag/filter' do
    redirect "tag/#{params[:filter]}"
  end

  get '/tag/:filter' do
    "This might work"
    @filter = params[:filter]
    tag = Tag.all(title: params[:filter])
    @links = tag ? tag.links : []
    erb:'links/index'
  end


  get '/links/new' do
    erb:'links/new'
  end

run! if app_file == $0

attr_accessor :links

end
