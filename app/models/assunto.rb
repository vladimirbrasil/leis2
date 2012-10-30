# == Schema Information
#
# Table name: assuntos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assunto < ActiveRecord::Base
  attr_accessible :name

 	before_save { self.name = self.name.downcase.strip.gsub("  "," ") }
end
