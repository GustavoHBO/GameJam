extends KinematicBody2D

var motion = Vector2()
var velocidade = 200

var defaultTexture = preload("res://icon.png")
var transformationTexture = preload("res://key.png")
var isTransformed = false

var pos_x_inicial
var pos_y_inicial

func _ready():
	pos_x_inicial = $".".position.x
	pos_y_inicial = $".".position.y

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
	elif Input.is_action_just_pressed("ui_select"):
		if isTransformed:
			get_node("Sprite").set_texture(defaultTexture)
			isTransformed = false
		else:
			get_node("Sprite").set_texture(transformationTexture)
			isTransformed = true;
	
	move_and_slide(motion)

func _on_deteccao_body_entered(body):
	if body.get_name() != "Parede":
		$".".position.x = pos_x_inicial
		$".".position.y = pos_y_inicial
	pass