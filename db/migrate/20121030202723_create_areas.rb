class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.text :name

      t.timestamps
    end
    
    add_index :areas, :name, unique: true
  end
end
