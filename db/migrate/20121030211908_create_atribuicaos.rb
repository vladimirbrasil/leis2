class CreateAtribuicaos < ActiveRecord::Migration
  def change
    create_table :atribuicaos do |t|
      t.integer :verbo_id
      t.integer :area_id

      t.timestamps
    end

    add_index :atribuicaos, :verbo_id
    add_index :atribuicaos, :area_id
    add_index :atribuicaos, [:verbo_id, :area_id], unique: true    
  end
end
