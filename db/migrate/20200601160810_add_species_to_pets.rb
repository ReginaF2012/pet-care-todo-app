class AddSpeciesToPets < ActiveRecord::Migration
  def change
    add_column :pets, :species, :string
  end
end
