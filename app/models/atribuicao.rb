class Atribuicao < ActiveRecord::Base
  attr_accessible :area_id, :verbo_id

  belongs_to :verbo
  belongs_to :area

  has_many :classe_atribuicaos, foreign_key: "atribuicao_id", dependent: :destroy
  has_many :reverse_classe_atribuicaos, class_name: :ClasseAtribuicao
	has_many :classes, :through => :classe_atribuicaos, :source => :classe 

  has_many :cargo_atribuicaos, foreign_key: "atribuicao_id", dependent: :destroy
  has_many :reverse_cargo_atribuicaos, class_name: :CargoAtribuicao
	has_many :cargos, :through => :cargo_atribuicaos, :source => :cargo 

end
