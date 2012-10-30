# == Schema Information
#
# Table name: verbos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Verbo < ActiveRecord::Base
  attr_accessible :name

  has_many :atribuicaos, foreign_key: "verbo_id", dependent: :destroy
  has_many :reverse_atribuicaos, class_name: :Atribuicao
  has_many :areas, through: :atribuicaos, source: :area

	before_save { self.name = self.name.downcase.strip.gsub("  "," ") }

	validates :name, presence: true, length: { minimum: 2 }

end
