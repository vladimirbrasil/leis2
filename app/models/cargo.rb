# == Schema Information
#
# Table name: cargos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cargo < ActiveRecord::Base
  attr_accessible :name

  has_many :cargos_atribuicaos, foreign_key: "cargo_id", dependent: :destroy
  has_many :reverse_cargos_atribuicaos, class_name: :CargoAtribuicao
	has_many :atribuicaos, :through => :cargos_atribuicaos, :source => :atribuicao 

 	before_save { self.name = self.name.downcase.strip.gsub("  "," ") }
 	
end
