# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < ActiveRecord::Base
  attr_accessible :name, :verbo_tokens

  has_many :atribuicaos, foreign_key: "area_id", dependent: :destroy
  has_many :reverse_atribuicaos, class_name: :Atribuicao
	has_many :verbos, :through => :atribuicaos, :source => :verbo

  attr_reader :verbo_tokens

	before_save { self.name = self.name.downcase.strip.gsub("  "," ") }

	validates :name, presence: true, length: { minimum: 2 }

  def verbo_tokens=(ids)
    self.verbo_ids = ids.split(",")
  end
end
