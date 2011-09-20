class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name, :limit => 64
      t.text :about
      t.text :note
      t.string :avatar
      t.boolean :is_admin  , :null => false, :default => false
      t.boolean :is_allowed, :null => false, :default => true
      t.boolean :is_active , :null => false, :default => true
      
      t.index :name
    end
  end
end
