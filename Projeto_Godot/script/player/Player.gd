extends KinematicBody2D

onready var sprite = $sprite_costas

var motion = Vector2()
var velocidade = 200

var pos_x_inicial
var pos_y_inicial

var pos_x_atual
var pos_y_atual

var direcao = 0

var i = 0
var distancia = 50

func _ready():
	pos_x_inicial = $".".position.x
	pos_y_inicial = $".".position.y
	
	pos_x_atual = $".".position.x
	pos_y_atual = $".".position.y

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	
	if Input.is_action_pressed("ui_up"):
		proximo_sprite()		
		motion.y = -velocidade
	elif Input.is_action_pressed("ui_down"):
		motion.y = velocidade
	elif Input.is_action_pressed("ui_right"):
		motion.x = velocidade
	elif Input.is_action_pressed("ui_left"):
		motion.x = -velocidade
	move_and_slide(motion)

func _on_deteccao_body_entered(body):
	if body.get_name() != "Parede":
		$".".position.x = pos_x_inicial
		$".".position.y = pos_y_inicial
	pass
	
func proximo_sprite():
	if abs($".".position.x - pos_x_atual) < distancia || abs($".".position.y - pos_y_atual) < distancia:
		if direcao == 0:
			sprite.frame = i
			i += 1
		if i >= 4:
			i = 0