class AddDefaultValueToCompleteColumn < ActiveRecord::Migration
  def change   
    change_column :todos, :complete, :boolean, :default => false
  end
end
