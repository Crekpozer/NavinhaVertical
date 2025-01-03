class_name Bullet
extends Node2D

# Velocidade do projétil
@export var speed: float = 250

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Move o projetil para cima (No eixo y negativo)
	position.y -= speed * delta
	
	# Remove o projétil se ele sair da tela
	if position.y < 0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	# DEBUG
	print(body)
	
	# Detecta se o corpo que ele colidiu faz parte do grupo de inimigos
	if body is Enemy:
		print("é um inimigo")
		# Destroi o inimigo e o projetil
		body.queue_free()
		queue_free()
		return
	
	print("não é um inimigo")


func _on_area_2d_area_entered(area: Area2D) -> void:
	# DEBUG
	print(area)
	
	# Detecta se o corpo que ele colidiu faz parte do grupo de inimigos
	if area.is_in_group("enemies"):
		print("é um inimigo")
		# Destroi o inimigo e o projetil
		area.queue_free()
		queue_free()
		return
	
	print("não é um inimigo")
