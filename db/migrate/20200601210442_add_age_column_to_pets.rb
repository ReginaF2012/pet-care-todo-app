class AddAgeColumnToPets < ActiveRecord::Migration
  def change
    add_column :pets, :age, :integer
  end
end
