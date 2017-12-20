extends VehicleBody

# Member variables
const STEER_SPEED = 1
const STEER_LIMIT = 0.4

var steer_angle = 0
var steer_target = 0

export var engine_force = 400
#funcion que agrega a las variables  GLOBAL.posicion_coche
func grabar_fantasma():
	GLOBAL.posicion_coche_x_0.append(get_transform().basis.x[0])
	GLOBAL.posicion_coche_x_1.append(get_transform().basis.x[1])
	GLOBAL.posicion_coche_x_2.append(get_transform().basis.x[2])
	
	GLOBAL.posicion_coche_y_0.append(get_transform().basis.y[0])
	GLOBAL.posicion_coche_y_1.append(get_transform().basis.y[1])
	GLOBAL.posicion_coche_y_2.append(get_transform().basis.y[2])
	
	GLOBAL.posicion_coche_z_0.append(get_transform().basis.z[0])
	GLOBAL.posicion_coche_z_1.append(get_transform().basis.z[1])
	GLOBAL.posicion_coche_z_2.append(get_transform().basis.z[2])
	
	GLOBAL.posiciones_coche.append(get_global_transform())
#	print("posicion_coche: ",get_transform().basis)
	
func _fixed_process(delta):
#	if GLOBAL.grabar_fantasma:
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



func _ready():
	set_fixed_process(true)