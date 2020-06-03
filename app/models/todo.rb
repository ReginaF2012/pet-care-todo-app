class Todo < ActiveRecord::Base
    has_many :pet_todos
    has_many :pets, through: :pet_todos
end