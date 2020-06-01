class Pet < ActiveRecord::Base
    validates :name, :presence => :true
    belongs_to :user

    after_create :make_slug

    after_update :change_slug

    def make_slug
        self.update(slug: "#{self.name.parameterize}#{self.id}")
    end

    def change_slug
        if self.name_changed?
            make_slug
        end
    end
end