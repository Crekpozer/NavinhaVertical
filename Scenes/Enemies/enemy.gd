class_name Enemy
extends Node2D

# Velocidade de movimento horizontal
@export var speed: float = 10
# Amplitude do movimento (quão longe a nave vai para cada lado)
@export var amplitude: float = 900
# Posição inicial da nave
var startPosition: Vector2

var isOnScreen: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Salva a posição inicial
	startPosition = position
