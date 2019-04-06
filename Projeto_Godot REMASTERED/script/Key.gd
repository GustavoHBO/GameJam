extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_world_2d();
	pass


func _collect_key(body):
	queue_free()
	pass # Replace with function body.
