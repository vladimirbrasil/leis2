class CreateCargoAtribuicaos < ActiveRecord::Migration
  def change
    create_table :cargo_atribuicaos do |t|
      t.integer :cargo_id
      t.integer :atribuicao_id

      t.timestamps
    end
    
    add_index :cargo_atribuicaos, :cargo_id
    add_index :cargo_atribuicaos, :atribuicao_id
    add_index :cargo_atribuicaos, [:cargo_id, :atribuicao_id], unique: true    
  end
end
