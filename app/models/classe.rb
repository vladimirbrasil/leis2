# == Schema Information
#
# Table name: classes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classe < ActiveRecord::Base
  attr_accessible :name

  has_many :classes_atribuicaos, foreign_key: "classe_id", dependent: :destroy
  has_many :reverse_classes_atribuicaos, class_name: :ClasseAtribuicao
	has_many :atribuicaos, :through => :classes_atribuicaos, :source => :atribuicao 

 	before_save { self.name = self.name.downcase.strip.gsub("  "," ") }
 	
end
