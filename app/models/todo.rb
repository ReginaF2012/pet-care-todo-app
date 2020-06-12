class Todo < ActiveRecord::Base
    has_many :pet_todos
    has_many :pets, through: :pet_todos
    belongs_to :user
    after_create :set_user

    def set_user
        self.update(user: self.pets.first.user)
    end


end