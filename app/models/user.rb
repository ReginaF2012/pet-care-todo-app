class User < ActiveRecord::Base
    has_many :pets
    has_many :to_dos, through: :pets
    validates :username, :presence => true,
                         :uniqueness => true
    has_secure_password
end