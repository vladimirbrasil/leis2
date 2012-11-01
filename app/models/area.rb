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

  def self.all_joins
    Area.find_by_sql("SELECT areas.name AS Area_name, cargos.name AS Cargo_name, classes.name AS Classe_name, verbos.name AS Verbo_name 
                      FROM verbos INNER JOIN (classes INNER JOIN (cargos INNER JOIN (((areas INNER JOIN atribuicaos 
                      ON areas.id = atribuicaos.area_id) INNER JOIN cargo_atribuicaos ON atribuicaos.id = cargo_atribuicaos.atribuicao_id) 
                      INNER JOIN classe_atribuicaos ON atribuicaos.id = classe_atribuicaos.atribuicao_id) ON cargos.id = cargo_atribuicaos.cargo_id) 
                      ON classes.id = classe_atribuicaos.classe_id) ON verbos.id = atribuicaos.verbo_id ORDER BY areas.name, cargos.name, classes.name, verbos.name;")
  end

  # INNER JOIN orders ON clients.id = orders.client_id
  # ORDER clients.created_at desc")


      # Area.find(17).verbos.join(classes.join(cargos.join(((areas.join(atribuicaos).on(areas[:id].eq(atribuicaos[:area_id]))).join(cargo_atribuicaos).on(atribuicaos[:id].eq(cargo_atribuicaos[:atribuicao_id]))).join(classe_atribuicaos).on(atribuicaos[:id].eq(classe_atribuicaos[:atribuicao_id]))).on(cargos[:id].eq(cargo_atribuicaos[:cargo_id]))).on(classes[:id].eq(classe_atribuicaos[:classe_id]))).on(verbos[:id].eq(atribuicaos[:verbo_id]))

      # self.dados = verbos.join(classes.join(cargos.join(((areas.join(atribuicaos).on(areas[:id].eq(atribuicaos[:area_id]))).join(cargo_atribuicaos).on(atribuicaos[:id].eq(cargo_atribuicaos[:atribuicao_id]))).join(classe_atribuicaos).on(atribuicaos[:id].eq(classe_atribuicaos[:atribuicao_id]))).on(cargos[:id].eq(cargo_atribuicaos[:cargo_id]))).on(classes[:id].eq(classe_atribuicaos[:classe_id]))).on(verbos[:id].eq(atribuicaos[:verbo_id]))

      # self.dados = verbos.join   
      #                 (classes.join
      #                   (cargos.join
      #                         (
      #                             (
      #                               (areas.join(atribuicaos).on(areas[:id].eq(atribuicaos[:area_id])))
      #                                   .join(cargo_atribuicaos).on(atribuicaos[:id].eq(cargo_atribuicaos[:atribuicao_id])))
      #                                       .join(classe_atribuicaos).on(atribuicaos[:id].eq(classe_atribuicaos[:atribuicao_id])))
      #                                           .on(cargos[:id].eq(cargo_atribuicaos[:cargo_id])))
      #                                             .on(classes[:id].eq(classe_atribuicaos[:classe_id])))
      #                                               .on(verbos[:id].eq(atribuicaos[:verbo_id]))


end

# SELECT Area.name AS Area_name, Cargo.name AS Cargo_name, Classe.name AS Classe_name, Verbo.name AS Verbo_name
# FROM Verbo INNER JOIN 
#     (Classe INNER JOIN 
#           (Cargo INNER JOIN 
#                 (
#                     (
#                       (Area INNER JOIN Atribuicao ON Area.id = Atribuicao.area_id) 
#                           INNER JOIN CargoAtribuicao ON Atribuicao.id = CargoAtribuicao.atribuicao_id) 
#                               INNER JOIN ClasseAtribuicao ON Atribuicao.id = ClasseAtribuicao.atribuicao_id) 
#                                 ON Cargo.id = CargoAtribuicao.cargo_id) 
#                                   ON Classe.id = ClasseAtribuicao.classe_id) 
#                                     ON Verbo.id = Atribuicao.verbo_id
# ORDER BY Area.name, Cargo.name, Classe.name, Verbo.name;

# SELECT Area.name AS Area_name, Cargo.name AS Cargo_name, Classe.name AS Classe_name, Verbo.name AS Verbo_name FROM Verbo INNER JOIN (Classe INNER JOIN (Cargo INNER JOIN (((Area INNER JOIN Atribuicao ON Area.id = Atribuicao.area_id) INNER JOIN CargoAtribuicao ON Atribuicao.id = CargoAtribuicao.atribuicao_id) INNER JOIN ClasseAtribuicao ON Atribuicao.id = ClasseAtribuicao.atribuicao_id) ON Cargo.id = CargoAtribuicao.cargo_id) ON Classe.id = ClasseAtribuicao.classe_id) ON Verbo.id = Atribuicao.verbo_id ORDER BY Area.name, Cargo.name, Classe.name, Verbo.name;
      

