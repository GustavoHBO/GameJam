extends KinematicBody2D

var motion = Vector2()
var velocidade = 100

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	
	if Input.is_action_pressed("ui_up"):
		motion.y = -velocidade
	elif Input.is_action_pressed("ui_down"):
		motion.y = velocidade
	elif Input.is_action_pressed("ui_right"):
		motion.x = velocidade
	elif Input.is_action_pressed("ui_left"):
		motion.x = -velocidade
	
	move_and_slide(motion)