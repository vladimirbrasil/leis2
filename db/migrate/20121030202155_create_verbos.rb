class CreateVerbos < ActiveRecord::Migration
  def change
    create_table :verbos do |t|
      t.string :name

      t.timestamps
    end
    add_index :verbos, :name, unique: true
  end
end
