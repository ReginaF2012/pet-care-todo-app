class Pet < ActiveRecord::Base
    belongs_to :user
    validates :name, :presence => :true

    after_create :make_slug

    def make_slug
        self.slug = "#{self.name.parameterize}#{self.id}"
    end

    def self.find_by_slug(slug)
        self.find_by(slug: slug)
    end
end