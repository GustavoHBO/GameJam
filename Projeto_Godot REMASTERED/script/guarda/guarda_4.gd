extends StaticBody2D

var pos_inicial
var pos_1
var pos_2

var orientacao = false # true para horizontal, false para vertical

var dist_1 = 140
var dist_2 = 0

var direcao = 0 # direção 0 faz com que o lado da movimentação seja sorteado, 1 move para direita, 2 para a esquerda

var velocidade = 2

var pos_x_atual = 0
var pos_y_atual = 0
var distancia = 10
var i = 0
onready var sprite = $traje

func _ready():
	if orientacao:
		pos_inicial = $".".position.x
	else:
		pos_inicial = $".".position.y
	pos_1 = pos_inicial + dist_1	
	pos_2 = pos_inicial - dist_2
	
	pos_x_atual = $".".position.x
	pos_y_atual = $".".position.y
	
	sprite.frame = 0	

func _process(delta):
	if direcao == 0:
		if randi()%2 == 0:
			direcao = 1
		else:
			direcao = 2
	if direcao == 1:
		if $".".position.x <= pos_1 && orientacao:
			$".".position.x += velocidade
		elif $".".position.y <= pos_1 && !orientacao:
			$".".position.y += velocidade
		else:
			direcao = 2
	if direcao == 2:
		if $".".position.x >= pos_2 && orientacao:
			$".".position.x -= velocidade
		elif $".".position.y >= pos_2 && !orientacao:
			$".".position.y -= velocidade
		else:
			direcao = 1
	proximo_sprite()

func _on_RigidBody2D_body_entered(body):
	pass # Replace with function body.

func proximo_sprite():
	if abs($".".position.x - pos_x_atual) >= distancia || abs($".".position.y - pos_y_atual) >= distancia:
		pos_x_atual = $".".position.x
		pos_y_atual = $".".position.y
		if direcao == 1:
			if i < 0 || i > 3:
				i = 0
			sprite.frame = i
			i += 1
		elif direcao == 2:
			if i < 12 || i > 15:
				i = 12
			sprite.frame = i
			i += 1
		elif direcao == 3:
			if i < 4 || i > 7:
				i = 4
			sprite.frame = i
			i += 1
		else:
			if i < 8 || i > 11:
				i = 8
			sprite.frame = i
			i += 1