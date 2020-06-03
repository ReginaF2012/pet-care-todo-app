class Todo < ActiveRecord::Base
    has_many :pet_todos
    has_many :pets, through: :pet_todos

    after_initialize :not_complete

    def not_complete
        self.complete = false
    end
end