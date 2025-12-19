extends CharacterBody2D

@export var speed = 100

var rocket_scene = preload("res://scenes/rocket.tscn")

func _physics_process(_delta: float) -> void:
	var screensize  = get_viewport_rect().size

	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("move_down"):
		velocity.y = speed
	move_and_slide()
	#clamp the player to the screensize so it can not go outside the screen area
	#global_position.x = clampf(global_position.x, 0, screensize.x)
	#global_position.y = clampf(global_position.y, 0, screensize.y)
	
	#clampf can also be done like the below but is with much more code
	#if global_position.x < 0:
	#	global_position.x = 0
	#elif global_position.x > screensize.x:
	#	global_position.x = screensize.x
	#if global_position.y < 0:
	#	global_position.y = 0
	#elif global_position.y > screensize.y:
	#	global_position.y = screensize.y
		
	#global position itself also has a clamp position
	global_position = global_position.clamp(Vector2(0,0),screensize)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var rocket_instance = rocket_scene.instantiate()
	add_child(rocket_instance)
	rocket_instance.global_position.x += 80 #spawn the rocket furter on the x axis
