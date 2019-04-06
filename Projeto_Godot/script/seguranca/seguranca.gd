extends StaticBody2D

var pos_inicial
var pos_esquerda
var pos_direita

var dist_esquerda = 100
var dist_direita = 50

var direcao = 0 # direção 0 faz com que o lado da movimentação seja sorteado, 1 move para direita, 2 para a esquerda

var velocidade = 1

func _ready():
	pos_inicial = $".".position.x
	pos_esquerda = pos_inicial - dist_esquerda
	pos_direita = pos_inicial + dist_direita

func _process(delta):
	if direcao == 0:
		if randi()%2 == 0:
			direcao = 1
		else:
			direcao = 2
	if direcao == 1:
		if $".".position.x <= pos_direita:
			$".".position.x += velocidade
		else:
			direcao = 2
	if direcao == 2:
		if $".".position.x >= pos_esquerda:
			$".".position.x -= velocidade
		else:
			direcao = 1