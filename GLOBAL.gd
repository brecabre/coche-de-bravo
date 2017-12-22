extends Node

#posiciones coche

var	posicion_coche_x_0 = []
var	posicion_coche_x_1 = []
var	posicion_coche_x_2 = []
	
var	posicion_coche_y_0 = []
var	posicion_coche_y_1 = []
var	posicion_coche_y_2 = []
	
var	posicion_coche_z_0 = []
var	posicion_coche_z_1 = []
var	posicion_coche_z_2 = []

var origen_coche_0 = []
var origen_coche_1 = []
var origen_coche_2 = []

### posiciones circuito####

var	posicion_fantasma_circuito_1_x_0 = []
var	posicion_fantasma_circuito_1_x_1 = []
var	posicion_fantasma_circuito_1_x_2 = []
	
var	posicion_fantasma_circuito_1_y_0 = []
var	posicion_fantasma_circuito_1_y_1 = []
var	posicion_fantasma_circuito_1_y_2 = []
	
var	posicion_fantasma_circuito_1_z_0 = []
var	posicion_fantasma_circuito_1_z_1 = []
var	posicion_fantasma_circuito_1_z_2 = []

var origen_fantasma_circuito_1_0 = []
var origen_fantasma_circuito_1_1 = []
var origen_fantasma_circuito_1_2 = []

var posiciones_coche = {
	"posicion_coche_x_0":posicion_coche_x_0,
	"posicion_coche_x_1":posicion_coche_x_1,
	"posicion_coche_x_2":posicion_coche_x_2,
	
	"posicion_coche_y_0":posicion_coche_y_0,
	"posicion_coche_y_1":posicion_coche_y_1,
	"posicion_coche_y_2":posicion_coche_y_2,
	
	"posicion_coche_z_0":posicion_coche_z_0,
	"posicion_coche_z_1":posicion_coche_z_1,
	"posicion_coche_z_2":posicion_coche_z_2,
	
	"origen_coche_0": origen_coche_0,
	"origen_coche_1": origen_coche_1,
	"origen_coche_2": origen_coche_2
}
var posiciones_fantasma_circuito_1 = {

	"posicion_fantasma_circuito_1_x_0":posicion_fantasma_circuito_1_x_0,
	"posicion_fantasma_circuito_1_x_1":posicion_fantasma_circuito_1_x_1,
	"posicion_fantasma_circuito_1_x_2":posicion_fantasma_circuito_1_x_2,
	
	"posicion_fantasma_circuito_1_y_0":posicion_fantasma_circuito_1_y_0,
	"posicion_fantasma_circuito_1_y_1":posicion_fantasma_circuito_1_y_1,
	"posicion_fantasma_circuito_1_y_2":posicion_fantasma_circuito_1_y_2,
	
	"posicion_fantasma_circuito_1_z_0":posicion_fantasma_circuito_1_z_0,
	"posicion_fantasma_circuito_1_z_1":posicion_fantasma_circuito_1_z_1,
	"posicion_fantasma_circuito_1_z_2":posicion_fantasma_circuito_1_z_2,
	
	"origen_fantasma_circuito_1_0": origen_fantasma_circuito_1_0,
	"origen_fantasma_circuito_1_1": origen_fantasma_circuito_1_1,
	"origen_fantasma_circuito_1_2": origen_fantasma_circuito_1_2
}
# graba los tiempos del coche y del fantasma con la longitud de las listas
#var tiempo_coche = posicion_coche.size()
#var tiempo_fantasma = posicion_fantasma.size()

#var grabar_fantasma = true

var direccion = "res://fantasma.json"
#var diccionario = {"posicion_fantasma":posicion_fantasma}



func save_game():	
	
	var salvar = {
	"posiciones_fantasma_circuito_1": posiciones_fantasma_circuito_1
	
	}
	
	var file = File.new()
	file.open(direccion, file.WRITE)
	file.store_line(salvar.to_json())
	file.close()	
	
func load_game():  
	
	var file = File.new()
	if not file.file_exists(direccion):
		return
	
	file.open(direccion, File.READ)
	var data = {}
	data.parse_json(file.get_as_text())
	
	posicion_fantasma_circuito_1_x_0 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_0"]
	posicion_fantasma_circuito_1_x_1 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_1"]
	posicion_fantasma_circuito_1_x_2 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_2"]
	
	posicion_fantasma_circuito_1_y_0 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_0"]
	posicion_fantasma_circuito_1_y_1 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_1"]
	posicion_fantasma_circuito_1_y_2 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_2"]
	
	posicion_fantasma_circuito_1_z_0 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_0"]
	posicion_fantasma_circuito_1_z_1 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_1"]
	posicion_fantasma_circuito_1_z_2 = data.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_2"]

	origen_fantasma_circuito_1_0 = data.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_0"]
	origen_fantasma_circuito_1_1 = data.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_1"]
	origen_fantasma_circuito_1_2 = data.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_2"]
	
