class CreatePetTodos < ActiveRecord::Migration
  def change
    create_table :pet_todos do |t|
      t.belongs_to :pet
      t.belongs_to :todo
    end
  end
end
