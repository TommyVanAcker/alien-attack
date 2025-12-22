extends Node2D

@export var lives = 3
@export var points = 100
@onready var player = $Player
@onready var hud =$UI/HUD

var score = 0

func _ready() -> void:
	hud.set_score_label(score)

func _on_deathzone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_player_took_damage() -> void:
	lives -= 1
	print('remaining lives: ' + str(lives))
	if lives <= 0:
		print('Game Over')
		player.die()

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += points
	hud.set_score_label(score)
	
