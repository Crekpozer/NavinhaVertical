class_name Player
extends CharacterBody2D

# Atributos do avião

# Velocidade de movimento do avião
var flySpeed: float = 300
# Vetor de direção do movimento
var inputVector: Vector2 = Vector2(0, 0)

# Atributos do tiro

# Controla se o avião pode atirar
var canShoot: bool = true
# Cena do projetil
var bulletScene = preload("res://Character/Guns & Projectiles/bullet.tscn")
# Intervalo entre tiros, instanciado no momento da execução
@onready var shootInterval: Timer = %RechargeTimer

# Função chamada a cada frame, lida com processos gerais do personagem
func _process(_delta: float) -> void:
	# Lê os comandos do jogador
	read_input()

# Função responsavel por capturar os comandos do jogador
func read_input () -> void:
	# Detecta e salva a direção pressionada pelo jogador
	inputVector = Input.get_vector("move_left","move_right","move_foward","move_backwards")
	
	# Verifica se o jogador pressionou o comando de tiro e se o avião pode atirar
	if Input.is_action_pressed("shoot") and canShoot:
		Shoot()

# Função chamada a cada frame de física, lida com a movimentação do personagem
func _physics_process(_delta: float) -> void:
	# Calcula a nova velocidade com base na direção e velocidade do movimento
	var targetVelocity = inputVector * flySpeed
	# Suaviza a transição entre a velocidade atual e a nova velocidade
	velocity = lerp(velocity, targetVelocity, 0.20)
	# Move o personagem de acordo com a nova velocidade
	move_and_slide()

# Função responsável pelo tiro e pelo controle do intervalo entre os tiros
func Shoot():
	# Conecta o timer à função de recarga e inicia o timer
	shootInterval.connect("timeout", Reload)
	shootInterval.start()
	
	# Instancia e posiciona o projetil no mundo
	var bullet = bulletScene.instantiate()
	bullet.position = %GunPos1.global_position
	get_parent().add_child(bullet)
	
	# Define que o avião não pode atirar novamente até a recarga
	canShoot = false

# Função resposável por permitir que o avião atire novamente depois de um intervalo
func Reload():
	# Permite que o avião possa atirar novamente
	canShoot = true
	# Para o timer de recarga
	shootInterval.stop()
