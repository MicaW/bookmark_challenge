class Tag

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  #has n, :links, :through => Resource

  end
