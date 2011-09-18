class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name, :limit => 64
      t.text :about
      t.text :note
      t.string :avatar
      t.boolean :is_admin, :default => false, :null => false
      
      t.index :name
    end
  end
end
