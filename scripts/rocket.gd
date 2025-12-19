extends Area2D

@export var speed = 1200

@onready var visible_notifier = $VisibleOnScreenNotifier2D

func _ready() -> void:
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta #delta calculated per second instead of framerate

func _on_screen_exited():
	queue_free()
