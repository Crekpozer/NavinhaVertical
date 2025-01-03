class_name Bullet
extends Node2D

# Velocidade do projétil
@export var speed: float = 250

# Função chamada a cada frame. 'delta' é o tempo decorrido desde o frame anterior.
func _process(delta: float) -> void:
	
	# Move o projetil para cima (No eixo y negativo)
	position.y -= speed * delta
	
	# Remove o projétil se ele sair da tela
	if position.y < 0:
		queue_free()

# Função chamada quando o projétil colide com uma área2D
func _on_area_2d_area_entered(area: Area2D) -> void:
	# Imprime a área colidida para depuração
	print(area)
	
	# Verifica se a área colidida perfentece ao grupo de inimigos
	if area.is_in_group("enemies"):
		print("é um inimigo")
		# Destroi o inimigo e o projetil
		area.queue_free()
		queue_free()
		return
	
	# Se não for um inimigo, imprime a mensagem
	print("não é um inimigo")
