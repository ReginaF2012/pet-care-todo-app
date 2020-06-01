class AddSlugColumnToPets < ActiveRecord::Migration
  def change
    add_column :pets, :slug, :string
  end
end
