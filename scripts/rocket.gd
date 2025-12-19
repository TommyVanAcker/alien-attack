extends Area2D

@export var speed = 1200


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta #delta calculated per second instead of framerate
