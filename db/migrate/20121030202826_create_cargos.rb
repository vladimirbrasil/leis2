class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :name

      t.timestamps
    end

    add_index :cargos, :name, unique: true
  end
end
