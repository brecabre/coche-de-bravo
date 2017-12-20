extends Node
var posiciones_coche =[]

var	posicion_coche_x_0 = []
var	posicion_coche_x_1 = []
var	posicion_coche_x_2 = []
	
var	posicion_coche_y_0 = []
var	posicion_coche_y_1 = []
var	posicion_coche_y_2 = []
	
var	posicion_coche_z_0 = []
var	posicion_coche_z_1 = []
var	posicion_coche_z_2 = []


# graba los tiempos del coche y del fantasma con la longitud de las listas
#var tiempo_coche = posicion_coche.size()
#var tiempo_fantasma = posicion_fantasma.size()

#var grabar_fantasma = true

var direccion = "res://fantasma.json"
#var diccionario = {"posicion_fantasma":posicion_fantasma}



func save_game():	
	
	var salvar = {
	"posicion_coche_x_0":posicion_coche_x_0,
	"posicion_coche_x_1":posicion_coche_x_1,
	"posicion_coche_x_2":posicion_coche_x_2,
	
	"posicion_coche_y_0":posicion_coche_y_0,
	"posicion_coche_y_1":posicion_coche_y_1,
	"posicion_coche_y_2":posicion_coche_y_2,
	
	"posicion_coche_z_0":posicion_coche_z_0,
	"posicion_coche_z_1":posicion_coche_z_1,
	"posicion_coche_z_2":posicion_coche_z_2
	}	
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
	
