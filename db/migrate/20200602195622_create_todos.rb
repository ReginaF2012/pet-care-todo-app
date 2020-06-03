class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.datetime :datetime
      t.boolean :complete
    end
  end
end
