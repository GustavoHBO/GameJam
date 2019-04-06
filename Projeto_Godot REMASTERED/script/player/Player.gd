extends KinematicBody2D

onready var sprite = $trajes

var motion = Vector2()
var velocidade = 200

var defaultTexture = preload("res://icon.png")
var transformationTexture = preload("res://sprites/key.png")
var isTransformed = false

var pos_x_inicial
var pos_y_inicial

var pos_x_atual
var pos_y_atual

var direcao = 0

var i = 0
var distancia = 5

func _ready():
	pos_x_inicial = $".".position.x
	pos_y_inicial = $".".position.y
	
	pos_x_atual = $".".position.x
	pos_y_atual = $".".position.y

func _physics_process(delta):
	motion.x = 0
	motion.y = 0

	if Input.is_action_pressed("ui_up"):
		direcao = 1
		motion.y = -velocidade
	elif Input.is_action_pressed("ui_down"):
		direcao = 0
		motion.y = velocidade
	elif Input.is_action_pressed("ui_right"):
		direcao = 2
		motion.x = velocidade
	elif Input.is_action_pressed("ui_left"):
		direcao = 3
		motion.x = -velocidade
	elif Input.is_action_just_pressed("ui_select"):
		if isTransformed:
			get_node("Sprite").set_texture(defaultTexture)
			isTransformed = false
		else:
			get_node("Sprite").set_texture(transformationTexture)
			isTransformed = true;
	move_and_slide(motion)
	proximo_sprite()	
	
func proximo_sprite():
	if abs($".".position.x - pos_x_atual) >= distancia || abs($".".position.y - pos_y_atual) >= distancia:
		pos_x_atual = $".".position.x
		pos_y_atual = $".".position.y
		if direcao == 0:
			if i < 0 || i > 3:
				i = 0
			sprite.frame = i
			i += 1
		elif direcao == 1:
			if i < 12 || i > 15:
				i = 12
			sprite.frame = i
			i += 1
		elif direcao == 2:
			if i < 4 || i > 7:
				i = 4
			sprite.frame = i
			i += 1
		else:
			if i < 8 || i > 11:
				i = 8
			sprite.frame = i
			i += 1

func _on_Player_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	print(body.get_name())
	if body.get_name() != "TileMap":
		$".".position.x = pos_x_inicial
		$".".position.y = pos_y_inicial
		
	pass # Replace with function body.
