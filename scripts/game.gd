extends Node2D

@export var lives = 3
@export var points = 100
@onready var player = $Player
@onready var hud =$UI/HUD
@onready var ui = $UI
@onready var gos = preload("res://scenes/game_over_screen.tscn")

var score = 0

func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_deathzone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives(lives)
	if lives <= 0:
		player.die()
		await get_tree().create_timer(1.5).timeout
		show_game_over_screen()

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += points
	hud.set_score_label(score)
	
func show_game_over_screen():
	var gos_instance = gos.instantiate()
	ui.add_child(gos_instance)
	gos_instance.set_score_label(score)
	
