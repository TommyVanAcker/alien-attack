extends Node2D

@export var lives = 3
@export var points = 100
@onready var player = $Player

var score = 0

func _on_deathzone_area_entered(area: Area2D) -> void:
	area.die()

func _on_player_took_damage() -> void:
	lives -= 1
	if lives <= 0:
		player.die()

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += points
	
