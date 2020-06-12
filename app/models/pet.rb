class Pet < ActiveRecord::Base
    validates :name, :presence => :true
    after_create :make_slug
    belongs_to :user
    has_many :pet_todos
    has_many :todos, through: :pet_todos
    after_destroy :delete_todos_if_only_pet

    def delete_todos_if_only_pet
        todos.each do |todo|
            todo.destroy if todo.pets.count == 0
        end
    end

    def make_slug
        self.update(slug: "#{self.name.parameterize}#{self.id}")
    end

end