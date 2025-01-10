extends Node2D

var tileMaplayer: Node2D
var speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	tileMaplayer = %TileMapLayers

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.y += speed * delta
