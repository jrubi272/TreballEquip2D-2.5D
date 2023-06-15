extends Personatge

onready var espasa: Node2D = get_node("Espasa")


func _process(_delta: float) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and anim_sprite.flip_h:
		anim_sprite.flip_h = false
	elif mouse_direction.x < 0 and not anim_sprite.flip_h:
		anim_sprite.flip_h = true
	
	espasa.rotation = mouse_direction.angle()
	if espasa.scale.y == 1 and mouse_direction.x < 0:
		espasa.scale.y = -1
	elif espasa.scale.y == -1 and mouse_direction.x > 0:
		espasa.scale.y = 1

func get_input() -> void:
	direccio = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		direccio += Vector2.DOWN
		print("d")
		print(direccio)
	if Input.is_action_pressed("ui_left"):
		direccio += Vector2.LEFT
		print("l")
		print(direccio)
	if Input.is_action_pressed("ui_right"):
		direccio += Vector2.RIGHT
		print("r")
		print(direccio)
	if Input.is_action_pressed("ui_up"):
		direccio += Vector2.UP
		print("u")
		print(direccio)

