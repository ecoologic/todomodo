class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name, :null => false, :limit => 64
      t.text :about
      t.text :note
      t.string :avatar
      
      t.index :name
    end
  end
end
