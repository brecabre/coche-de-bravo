extends Node

var posicion_coche =[]
var posicion_fantasma =[]
var record_vuelta = 0

var direccion = "res://fantasma.json"
var diccionario = {"posicion_fantasma":posicion_fantasma,
					"record_vuelta":record_vuelta
					}

func save_game():
	var salvar = {"diccionario":diccionario}	
	var file = File.new()
	file.open(direccion, file.WRITE)
	file.store_line(salvar.to_json())
	file.close()

#func load_game():  
#	
#	var file = File.new()
#	if not file.file_exists(direccion):
#		return
#	
#	file.open(direccion, File.READ)
#	var data = {}
#	data.parse_json(file.get_as_text())
#	diccionario = data.diccionario
	