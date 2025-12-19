extends Area2D

@export var speed = 100

func _process(delta: float) -> void:
	global_position.x -= speed * delta
