ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  DataMapper::Logger.new($stdout, :debug)

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

  get '/' do
     redirect '/sign_in'
   end

  get '/sign_in' do
    erb:'sign_in'
  end

  post '/sign_in' do
    user = User.first_or_create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @name = current_user.name
    erb:'links/index'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tags = params[:tag].split(', ')
    tags.each do |tag|
      link.tags << (Tag.first_or_create(title: tag))
      link.save
    end
    redirect '/links'
  end

  post '/tag/filter' do
    redirect "tag/#{params[:filter].downcase}"
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
