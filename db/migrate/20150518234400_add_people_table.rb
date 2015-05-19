class AddPeopleTable < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.timestamps null: false
      t.integer :flavor_id
    end
  end
end
