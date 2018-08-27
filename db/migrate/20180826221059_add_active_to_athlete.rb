class AddActiveToAthlete < ActiveRecord::Migration[5.1]
  def change
    add_column :athletes, :active, :boolean, default: true
  end
end
