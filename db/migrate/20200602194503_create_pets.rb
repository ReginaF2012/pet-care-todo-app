class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.belongs_to :user
      t.string :slug
      t.string :name
      t.string :species
      t.string :breed
      t.integer :age
      t.date :birthday
      t.datetime :created_at
    end
  end
end
