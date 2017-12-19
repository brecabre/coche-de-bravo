extends VehicleBody

# Member variables
const STEER_SPEED = 1
const STEER_LIMIT = 0.4

var steer_angle = 0
var steer_target = 0

export var engine_force = 400

func grabar_fantasma():
	GLOBAL.posicion_coche.append(get_global_transform())

func _fixed_process(delta):
	if GLOBAL.grabar_fantasma:
		grabar_fantasma()
	
	get_node("Label").set_text(str(get_linear_velocity().length()))
	
	if (Input.is_action_pressed("guardar_fantasma")):
		GLOBAL.save_game()
#	
	if (Input.is_action_pressed("ui_left")):
		steer_target = -STEER_LIMIT
	elif (Input.is_action_pressed("ui_right")):
		steer_target = STEER_LIMIT
	else:
		steer_target = 0
	
	if (Input.is_action_pressed("ui_up")):
		set_engine_force(engine_force)
		
	else:
		set_engine_force(0)
		
	if (Input.is_action_pressed("ui_down")):
		set_engine_force(-engine_force)
#	if (Input.is_action_pressed("ui_down")):
#		set_engine_force(-engine_force)
#	else:
#		set_engine_force(0)
#	
	if (Input.is_action_pressed("ui_frenar")):
		set_brake(1)	
	
	else:
		set_brake(0.0)
	
	if (steer_target < steer_angle):
		steer_angle -= STEER_SPEED*delta
		if (steer_target > steer_angle):
			steer_angle = steer_target
	elif (steer_target > steer_angle):
		steer_angle += STEER_SPEED*delta
		if (steer_target < steer_angle):
			steer_angle = steer_target
	
	set_steering(steer_angle)

func salvar():
    var salvardicc = {
#       
        posx = get_transform().basis.x,
		posy = get_transform().basis.y,
        posz = get_transform().basis.z
}

func _ready():
	set_fixed_process(true)