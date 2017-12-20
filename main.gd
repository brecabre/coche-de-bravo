extends Spatial


onready var fantasma_escena = load("res://fantasma/fantasma.tscn")
var numero_frame = 0
var cargar_fantasma = false
var fantasma_corre = false

func _ready():
#	GLOBAL.load_game()
	set_process_input(true)
	set_fixed_process(true)
	pass

func cargar_fantasma():
		var fantasma = fantasma_escena.instance()
		get_parent().add_child(fantasma)
		print("hollllalala",get_global_transform().translated())
#		fantasma.set_transform(0,0,0)
#		fantasma.set_transform(Vector3(0,0,0)).basis.x
#		fantasma.set_transform(
#		[GLOBAL.posicion_coche_x_0[numero_frame] , GLOBAL.posicion_coche_x_1[numero_frame] , GLOBAL.posicion_coche_x_2[numero_frame] ],
#		[GLOBAL.posicion_coche_y_0[numero_frame] , GLOBAL.posicion_coche_y_1[numero_frame] , GLOBAL.posicion_coche_y_2[numero_frame] ],
#		[GLOBAL.posicion_coche_z_0[numero_frame] , GLOBAL.posicion_coche_z_1[numero_frame] , GLOBAL.posicion_coche_z_2[numero_frame] ]
#		).basis
		fantasma.set_global_transform(GLOBAL.posiciones_coche[numero_frame])
#		

func fantasma_corre():
	if 	fantasma_corre:
		numero_frame +=1
		get_tree().get_root().get_node("fantasma").set_global_transform(GLOBAL.posiciones_coche[numero_frame])
#		if numero_frame >= GLOBAL.posicion_coche_x.size()-1:
#			pass
#		else: numero_frame +=1
		
func _input(event):
	if (Input.is_action_pressed("aparece_fantasma")):	
		cargar_fantasma()
		fantasma_corre = true
		
func _fixed_process(delta):
	if fantasma_corre:
		fantasma_corre()

# area que hace que deje de grabar las posiciones del coche
#func _on_Area_body_enter( body ):	
# deja de grabar y sustituye el tiempo del fantasma por el del coche si este es menor 
#	GLOBAL.grabar_fantasma = false
	
#	if GLOBAL.posicion_fantasma.empty() or GLOBAL.posicion_coche.size() < GLOBAL.posicion_fantasma.size():
		
#		GLOBAL.posicion_fantasma = GLOBAL.posicion_coche
#		GLOBAL.save_game()
		