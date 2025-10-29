extends Node2D

var menu_scene = load ("res://Menu de jugador.tscn")
var level2_scene = load("res://BOSQUE NIVEL 2.tscn")

func _on_avanzar_pressed() -> void:
	get_tree().change_scene_to_packed(level2_scene)
	pass 

func _on_retroceder_pressed() -> void:
	get_tree().change_scene_to_packed(menu_scene)
	pass 
