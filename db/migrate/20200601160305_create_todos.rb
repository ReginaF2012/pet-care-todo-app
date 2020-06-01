class CreateTodos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :name
      t.text :description
      t.belongs_to :pet
    end
  end
end
