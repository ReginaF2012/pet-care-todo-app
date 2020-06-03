class Pet < ActiveRecord::Base
    validates :name, :presence => :true
    after_create :make_slug
    belongs_to :user
    has_many :pet_todos
    has_many :todos, through: :pet_todos

    def make_slug
        self.update(slug: "#{self.name.parameterize}#{self.id}")
    end

end