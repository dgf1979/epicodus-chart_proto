class RenamePersonsToPeople < ActiveRecord::Migration
  def change
    def self.up
    rename_table :persons, :people
  end
  def self.down
    rename_table :people, :persons
  end
  end
end
