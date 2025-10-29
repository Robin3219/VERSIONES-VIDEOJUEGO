extends Node2D

var level1_scene = load("res://CUIDAD NIVEL 1.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(level1_scene)
	pass # Replace with function body.
