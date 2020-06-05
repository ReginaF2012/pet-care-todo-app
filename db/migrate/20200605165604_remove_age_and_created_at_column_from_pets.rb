class RemoveAgeAndCreatedAtColumnFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :age
    remove_column :pets, :created_at
  end
end
