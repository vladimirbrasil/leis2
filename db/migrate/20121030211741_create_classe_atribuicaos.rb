class CreateClasseAtribuicaos < ActiveRecord::Migration
  def change
    create_table :classe_atribuicaos do |t|
      t.integer :classe_id
      t.integer :atribuicao_id

      t.timestamps
    end

    add_index :classe_atribuicaos, :classe_id
    add_index :classe_atribuicaos, :atribuicao_id
    add_index :classe_atribuicaos, [:classe_id, :atribuicao_id], unique: true    
  end
end
