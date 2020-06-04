class User < ActiveRecord::Base
    has_many :pets
    has_many :todos
    validates :username, :presence => true,
                         :uniqueness => true
    has_secure_password
end