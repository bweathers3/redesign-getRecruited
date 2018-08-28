class RemoveActiveFromAthlete < ActiveRecord::Migration[5.1]
  def change
    remove_column :athletes, :active, :boolean
  end
end
