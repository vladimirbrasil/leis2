require 'open-uri'
require 'active_record/fixtures'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # Como no Excel
# Att.delete_all
# open("db/dados/atribuicoes_geral.txt") do |atts|
#   atts.read.each_line do |att|
#     att.downcase! if att
#     clesp, cl1, cl2, cl3, apf, epf, ppf, dpf, pcf, ordem, verbos, area = att.chomp.split("|")
#     area = area.downcase.strip.gsub("  "," ")
#     verbos.gsub!(" e ", ", ")
#     v1, v2, v3, v4, v5, v6, v7, v8, v9 = verbos.split(",").reverse.collect { |x| x = x.downcase.strip.gsub("  "," ") } if verbos
#     # puts "#{verbos} >>> #{verbos.split(",").reverse.collect { |x| x = x.strip }} <<<<< #{v1}|#{v2}|#{v3}|#{v4}|#{v5}|#{v6}|#{v7}|#{v8}|#{v9}|"
#     Att.create( area: area, clesp: clesp.empty?, cl1: cl1.empty?, cl2: cl2.empty?, cl3: cl3.empty?, 
#                         apf: apf.empty?, epf: epf.empty?, ppf: ppf.empty?, opf: false, dpf: dpf.empty?, pcf: pcf.empty?,
#                         v1: v1, v2: v2, v3: v3, v4: v4, v5: v5, v6: v6, v7: v7, v8: v8, v9: v9)
#   end
# end


# Normalizada
Cargo.delete_all
["APF", "EPF", "PPF", "OPF", "DPF", "PCF"].each do |cargo|
  Cargo.find_or_create_by_name(cargo)
end

Classe.delete_all
["especial", "1", "2", "3"].each do |classe|
  Classe.find_or_create_by_name(classe)
end

Atribuicao.delete_all
CargoAtribuicao.delete_all
ClasseAtribuicao.delete_all
Area.delete_all
Verbo.delete_all
open("db/dados/atribuicoes_geral.txt") do |atts|
  atts.read.each_line do |att|
    att.downcase! if att
    classes = Array.new 
    cargos = Array.new
    classes[0], classes[1], classes[2], classes[3], cargos[0], cargos[1], cargos[2], cargos[3], cargos[4], ordem, verbos, area = att.chomp.split("|")
    verbos.gsub!(" e ", ", ")

    # puts "#{att}\n"            
    unless area.empty?
      area = area.downcase.strip.gsub("  "," ")
      @area = Area.find_or_create_by_name(area)
      # puts ">>>>area: #{@area.id}|#{@area.name}\n"            
      verbos.split(",").each do |verbo|
        unless verbo.empty?
          verbo = verbo.downcase.strip.gsub("  "," ")
          if @area
            @verbo = Verbo.find_or_create_by_name(verbo)
            @atribuicao = Atribuicao.find_or_create_by_verbo_id_and_area_id(@verbo.id, @area.id) 

            if @atribuicao
              # puts "<<<<<<<<verbo: #{verbo}"
              # puts ">>>>>>>>verbo: #{@verbo.id}|#{@verbo.name}>>>atribuicao: #{@atribuicao}"

              cargos.each do |cargo|
                unless cargo.empty?
                  # puts "#{cargo}"
                  cargo = cargo.downcase.strip.gsub("  "," ")
                  @cargo = Cargo.find_or_create_by_name(cargo)
                  @cargo_atrib = CargoAtribuicao.find_or_create_by_cargo_id_and_atribuicao_id(@cargo.id, @atribuicao.id) if @cargo
                  # puts "<<<<<<<<<<<<cargo: #{cargo}"
                  # puts ">>>>>>>>>>>>cargo: #{@cargo.id}|#{@cargo.name}>>>cargo_atrib: #{@cargo_atrib}" if @cargo and  @cargo_atrib            
                end
              end

              classes.each do |classe|
                unless classe.empty?
                  classe = classe.downcase.strip.gsub("  "," ")
                  @classe = Classe.find_or_create_by_name(classe)
                  @classe_atrib = ClasseAtribuicao.find_or_create_by_classe_id_and_atribuicao_id(@classe.id, @atribuicao.id) if @classe 
                  # puts "<<<<<<<<<<<<classe: #{classe}"
                  # puts ">>>>>>>>>>>>classe: #{@classe.id}|#{@classe.name}>>>classe_atrib: #{@classe_atrib}" if @classe and  @classe_atrib    
                end
              end
            end
          end
        end
      end 
    end
  end
end
