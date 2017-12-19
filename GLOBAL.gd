extends Node

# graba las posiciones del coche y del fantasma

var posicion_coche =[]
var posicion_fantasma =[]

# graba los tiempos del coche y del fantasma con la longitud de las listas
#var tiempo_coche = posicion_coche.size()
#var tiempo_fantasma = posicion_fantasma.size()

var grabar_fantasma = true

var direccion = "res://fantasma.json"
#var diccionario = {"posicion_fantasma":posicion_fantasma}


    return salvardicc
	
func load_game():  
	
	var file = File.new()
	if not file.file_exists(direccion):
		return
	
	file.open(direccion, File.READ)
	var data = {}
#	data.parse_json(file.get_as_text())
	data.parse_json(file.get_as_text())
#	diccionario = data.diccionario
	posicion_fantasma = data.posicion_fantasma
