class CreateAthletes < ActiveRecord::Migration[5.1]
  def change
    create_table :athletes do |t|
      t.string :firstName
      t.string :secondName
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
