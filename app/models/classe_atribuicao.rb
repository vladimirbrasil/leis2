class ClasseAtribuicao < ActiveRecord::Base
  attr_accessible :atribuicao_id, :classe_id

  belongs_to :atribuicao
  belongs_to :classe  
end
