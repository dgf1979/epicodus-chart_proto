class TableSetup < ActiveRecord::Migration
  def change
    create_table :flavors do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :persons do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :flavors_people do |t|
      t.integer :person_id
      t.integer :flavor_id
      t.timestamps null: false
    end
  end
end
