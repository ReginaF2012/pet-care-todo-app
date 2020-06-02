class AddTimeCollumnToTodos < ActiveRecord::Migration
  def change
    add_column :to_dos, :datetime, :string
  end
end
