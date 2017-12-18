extends Spatial


onready var fantasma_escena = load("res://fantasma/fantasma.tscn")

var numero_frame = 0
var cargar_fantasma = false
var fantasma_corre = false

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	pass

func cargar_fantasma():
		var fantasma = fantasma_escena.instance()
		get_parent().add_child(fantasma)
		fantasma.set_global_transform((GLOBAL.posicion_fantasma[numero_frame]))

func fantasma_corre():
	
	if 	fantasma_corre:
		get_tree().get_root().get_node("fantasma").set_global_transform((GLOBAL.posicion_fantasma[numero_frame]))
		numero_frame +=1

func _input(event):
	if (Input.is_action_pressed("aparece_fantasma")):	
		cargar_fantasma()
		fantasma_corre = true
		
func _fixed_process(delta):
	fantasma_corre()