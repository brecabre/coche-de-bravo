extends Spatial


onready var fantasma_escena = load("res://fantasma/fantasma.tscn")

var numero_frame = 0
var cargar_fantasma = false
var fantasma_corre = false

func _ready():
	GLOBAL.load_game()
	set_process_input(true)
	set_fixed_process(true)
	pass

func cargar_fantasma():
		var fantasma = fantasma_escena.instance()
		get_parent().add_child(fantasma)
#		fantasma.set_global_transform((GLOBAL.posicion_fantasma[numero_frame]))
#		String ( Transform 
		print(str(GLOBAL.posicion_fantasma[numero_frame]))
#		print(GLOBAL.posicion_fantasma[0])
		print("pepe")

func fantasma_corre():
	if 	fantasma_corre:
#		get_tree().get_root().get_node("fantasma").set_global_transform(GLOBAL.posicion_fantasma[numero_frame])
		if numero_frame >= GLOBAL.posicion_fantasma.size()-1:
			pass
		else: numero_frame +=1

func _input(event):
	if (Input.is_action_pressed("aparece_fantasma")):	
		cargar_fantasma()
		fantasma_corre = true
		
func _fixed_process(delta):
	fantasma_corre()

# area que hace que deje de grabar las posiciones del coche
func _on_Area_body_enter( body ):	
# deja de grabar y sustituye el tiempo del fantasma por el del coche si este es menor 
	
	GLOBAL.grabar_fantasma = false
	print(GLOBAL.grabar_fantasma)
	if GLOBAL.posicion_fantasma.empty() or GLOBAL.posicion_coche.size() < GLOBAL.posicion_fantasma.size():
#		GLOBAL.posicion_fantasma.clear ( )  
		GLOBAL.posicion_fantasma = GLOBAL.posicion_coche
		GLOBAL.save_game()
		