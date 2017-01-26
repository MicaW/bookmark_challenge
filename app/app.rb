require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  DataMapper::Logger.new($stdout, :debug)

  get '/links' do
  #use DataMapper to get all the Link objects in the database.
  @links = Link.all
  erb(:'link/index')
  end



# start the server if ruby file executed directly
run! if app_file == $0

end
