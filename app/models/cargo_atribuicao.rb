class CargoAtribuicao < ActiveRecord::Base
  attr_accessible :atribuicao_id, :cargo_id

  belongs_to :atribuicao
  belongs_to :cargo    
end
