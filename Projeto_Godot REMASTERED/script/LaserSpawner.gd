extends Node2D

export (PackedScene) var Spawned_scene
var isVisible
var laser

func _ready():
	pass


func _on_Timer_timeout():
	print(visible)
	if !isVisible:
		laser = Spawned_scene.instance()
		add_child(laser)
	if isVisible:
		remove_child(laser)
	isVisible = !isVisible
	
	pass # Replace with function body.
