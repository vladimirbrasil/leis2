class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :name

      t.timestamps
    end

    add_index :classes, :name, unique: true
  end
end
