class CreateAssuntos < ActiveRecord::Migration
  def change
    create_table :assuntos do |t|
      t.string :name

      t.timestamps
    end
    
    add_index :assuntos, :name, unique: true
  end
end
