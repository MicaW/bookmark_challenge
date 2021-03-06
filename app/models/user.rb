class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password, BCryptHash

end
