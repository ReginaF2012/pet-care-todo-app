class ChangeCreatedAtToTimestampForPets < ActiveRecord::Migration
  def change
    change_column :pets, :created_at, :timestamp
  end
end
