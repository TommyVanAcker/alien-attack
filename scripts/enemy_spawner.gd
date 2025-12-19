extends Node2D

@onready var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var timer = $Timer
@onready var spawn_positions = $SpawnPositions

func _ready() -> void:
	timer.connect("timeout", _on_time_out)
	

func _on_time_out():
	spawn_enemy()
	
func spawn_enemy() -> void:
	var spawn_pos_array = spawn_positions.get_children() #get the children of a node as an array
	var random_spawn_position = spawn_pos_array.pick_random() #pick a random child an put it in a variable
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	add_child(enemy_instance)
