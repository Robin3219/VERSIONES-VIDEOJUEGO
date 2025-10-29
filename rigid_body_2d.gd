extends CharacterBody2D

@export var max_health: int = 3
var health: int

func _ready() -> void:
	health = max_health
	add_to_group("player")  # lo metemos en el grupo "player"

func take_damage(amount: int) -> void:
	health -= amount
	print("Vida restante: ", health)
	if health <= 0:
		die()

func die() -> void:
	print("El jugador ha muerto")
	queue_free()   # elimina al jugador, o aquí puedes reiniciar nivel
