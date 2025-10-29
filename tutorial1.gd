extends CanvasLayer

@onready var dialog_text: Label = $Panel/DialogText

var current_step: int = 0

func _ready() -> void:
	dialog_text.text = "Pulsa D para moverte a la derecha."

func _process(_delta: float) -> void:
	match current_step:
		0:
			if Input.is_action_just_pressed("ui_right"):
				dialog_text.text = "Pulsa A para moverte a la izquierda."
				current_step = 1

		1:
			if Input.is_action_just_pressed("ui_left"):
				dialog_text.text = "Perfecto. Ya sabes moverte."
				current_step = 2
				hide_tutorial()

func hide_tutorial() -> void:
	await get_tree().create_timer(2.0).timeout
	$Panel.visible = false
