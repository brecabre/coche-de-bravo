extends Spatial


onready var fantasma_escena = preload("res://fantasma/fantasma.tscn")
var numero_frame = 0
var grabar_coche = true
var fantasma_corre = false


func _ready():
	cargar_fantasma()
	set_process_input(true)
	set_fixed_process(true)

### carga el diccionario y instancia la escena del fantasma ###
func cargar_fantasma():
	GLOBAL.load_game()
	var fantasma = fantasma_escena.instance()
	get_parent().add_child(fantasma)

### hace correr al fantasma recorriendo las listas del diccionario con "numero_frame" ###
func fantasma_corre():
	var nodo_fantasma = get_tree().get_root().get_node("fantasma")
	
	if GLOBAL.posiciones_fantasma_circuito_1.empty():
		pass	
	else:
		nodo_fantasma.set_global_transform(Transform(
		
		Vector3(GLOBAL.posicion_fantasma_circuito_1_x_0[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_x_1[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_x_2[numero_frame]),
		Vector3(GLOBAL.posicion_fantasma_circuito_1_y_0[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_y_1[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_y_2[numero_frame]),
		Vector3(GLOBAL.posicion_fantasma_circuito_1_z_0[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_z_1[numero_frame] , GLOBAL.posicion_fantasma_circuito_1_z_2[numero_frame]),
		Vector3(GLOBAL.origen_fantasma_circuito_1_0[numero_frame],GLOBAL.origen_fantasma_circuito_1_1[numero_frame],GLOBAL.origen_fantasma_circuito_1_2[numero_frame])))
		
		if numero_frame >= GLOBAL.posicion_fantasma_circuito_1_x_0.size()-1:
			pass
		else: numero_frame +=1

func grabar_coche():	
	var coche_nodo = get_node("coche/vehicle")
	
	GLOBAL.posicion_coche_x_0.append(coche_nodo.get_global_transform().basis.x[0])
	GLOBAL.posicion_coche_x_1.append(coche_nodo.get_global_transform().basis.x[1])
	GLOBAL.posicion_coche_x_2.append(coche_nodo.get_global_transform().basis.x[2])
	
	GLOBAL.posicion_coche_y_0.append(coche_nodo.get_global_transform().basis.y[0])
	GLOBAL.posicion_coche_y_1.append(coche_nodo.get_global_transform().basis.y[1])
	GLOBAL.posicion_coche_y_2.append(coche_nodo.get_global_transform().basis.y[2])
	
	GLOBAL.posicion_coche_z_0.append(coche_nodo.get_global_transform().basis.z[0])
	GLOBAL.posicion_coche_z_1.append(coche_nodo.get_global_transform().basis.z[1])
	GLOBAL.posicion_coche_z_2.append(coche_nodo.get_global_transform().basis.z[2])
	
	GLOBAL.origen_coche_0.append(coche_nodo.get_global_transform().origin[0])
	GLOBAL.origen_coche_1.append(coche_nodo.get_global_transform().origin[1])
	GLOBAL.origen_coche_2.append(coche_nodo.get_global_transform().origin[2])
	
func _input(event):
	
	if (Input.is_action_pressed("aparece_fantasma")):	
		cargar_fantasma()
		fantasma_corre = true
	
	if (Input.is_action_pressed("salvar")):
		GLOBAL.save_game()	

func _fixed_process(delta):
	if grabar_coche:
		grabar_coche()
	if fantasma_corre:
		fantasma_corre()

# area que hace que deje de grabar las posiciones del coche  "meta"
func _on_meta_body_enter( body ):
 #deja de grabar y sustituye el tiempo del fantasma por el del coche si este es menor 
	grabar_coche = false
#	
	if GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_0"].empty() or GLOBAL.posiciones_coche["posicion_coche_x_0"].size() < GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_0"].size():
		
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_0"] = GLOBAL.posicion_coche_x_0
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_1"] = GLOBAL.posicion_coche_x_1
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_x_2"] = GLOBAL.posicion_coche_x_2
	
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_0"] = GLOBAL.posicion_coche_y_0
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_1"] = GLOBAL.posicion_coche_y_1
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_y_2"] = GLOBAL.posicion_coche_y_2
		
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_0"] = GLOBAL.posicion_coche_z_0
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_1"] = GLOBAL.posicion_coche_z_1
		GLOBAL.posiciones_fantasma_circuito_1["posicion_fantasma_circuito_1_z_2"] = GLOBAL.posicion_coche_z_2
		
		GLOBAL.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_0"] = GLOBAL.origen_coche_0
		GLOBAL.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_1"] = GLOBAL.origen_coche_1
		GLOBAL.posiciones_fantasma_circuito_1["origen_fantasma_circuito_1_2"] = GLOBAL.origen_coche_2
		
		GLOBAL.save_game()
		print("entro")





	
