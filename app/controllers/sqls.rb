

users.join(photos).on(users[:id].eq(photos[:user_id]))
SELECT * FROM users INNER JOIN photos ON users.id = photos.user_id

areas.join(verbos).join(classes).join(classes).join(areas).join(atribuicaos).on(areas[:id].eq(atribuicaos[:id]))
SELECT Area.name AS Area_name, Cargo.name AS Cargo_name, Classe.name AS Classe_name, Verbo.name AS Verbo_name
FROM Verbo INNER JOIN 
		(Classe INNER JOIN 
					(Cargo INNER JOIN 
								(
										(
											(Area INNER JOIN Atribuicao ON Area.id = Atribuicao.area_id) 
													INNER JOIN CargoAtribuicao ON Atribuicao.id = CargoAtribuicao.atribuicao_id) 
															INNER JOIN ClasseAtribuicao ON Atribuicao.id = ClasseAtribuicao.atribuicao_id) 
																ON Cargo.id = CargoAtribuicao.cargo_id) 
																	ON Classe.id = ClasseAtribuicao.classe_id) 
																		ON Verbo.id = Atribuicao.verbo_id

ORDER BY Area.name, Cargo.name, Classe.name, Verbo.name;

			

			verbos.join
				(classes.join
					(cargos.join
								(
										(
											(areas.join(atribuicaos).on(areas[:id].eq(atribuicaos[:area_id])))
													.join(cargo_atribuicaos).on(atribuicaos[:id].eq(cargo_atribuicaos[:atribuicao_id])))
															.join(classe_atribuicaos).on(atribuicaos[:id].eq(classe_atribuicaos[:atribuicao_id])))
																	.on(cargos[:id].eq(cargo_atribuicaos[:cargo_id])))
																		.on(classes[:id].eq(classe_atribuicaos[:classe_id])))
																			.on(verbos[:id].eq(atribuicaos[:verbo_id]))