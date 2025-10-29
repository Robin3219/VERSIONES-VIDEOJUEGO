extends CharacterBody2D

@export var speed: float = 200.0
@export var run_speed: float = 350.0  # velocidad al correr
@export var jump_force: float = -400.0
@export var gravity: float = 900.0

@onready var animated2D = $Animated2D  

var jumps_done: int = 0
const MAX_JUMPS: int = 1  # solo 1 salto
var is_facing_right: bool = true  # coso de verdadero o falso 

func _ready() -> void:
	add_to_group("Player")  # 👈 esto permite que el enemigo lo detecte

func _physics_process(delta: float) -> void:
	# Gravedad
	if not is_on_floor():
		velocity.y += gravity * delta

	# Movimiento horizontal
	var input_dir = Input.get_axis("ui_left", "ui_right")

	var current_speed = speed
	if Input.is_action_pressed("aceleracion"):
		current_speed = run_speed

	velocity.x = input_dir * current_speed

	# Se voltea según la dirección
	if (is_facing_right and velocity.x > 0) or (not is_facing_right and velocity.x < 0):
		scale.x *= -1
		is_facing_right = not is_facing_right

	# Saltar
	if Input.is_action_just_pressed("ui_accept") and jumps_done < MAX_JUMPS:
		velocity.y = jump_force
		jumps_done += 1

	# Reiniciar saltos al tocar el suelo
	if is_on_floor():
		jumps_done = 0

	move_and_slide()
	update_animation()

func update_animation():
	if velocity.x == 0:
		animated2D.play("idle")
	else:
		animated2D.stop()  # cuando se mueva, se detiene la animación idle (por ahora)

	
