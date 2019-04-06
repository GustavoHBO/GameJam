extends StaticBody2D

var pos_inicial
var pos_1
var pos_2

var orientacao = true # true para horizontal, false para vertical

var dist_1 = 10
var dist_2 = 10

var direcao = 0 # direção 0 faz com que o lado da movimentação seja sorteado, 1 move para direita, 2 para a esquerda

var velocidade = 1

func _ready():
	if orientacao:
		pos_inicial = $".".position.x
	else:
		pos_inicial = $".".position.y
	pos_1 = pos_inicial + dist_1	
	pos_2 = pos_inicial - dist_2

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