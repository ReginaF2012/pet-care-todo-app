class Pet < ActiveRecord::Base
    validates :name, :presence => :true
    belongs_to :user

    after_create :make_slug

    def make_slug
        self.update(slug: "#{self.name.parameterize}#{self.id}")
    end

end