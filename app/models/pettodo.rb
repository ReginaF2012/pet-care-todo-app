class PetTodo < ActiveRecord::Base
    belongs_to :pet
    belongs_to :todo
end