class_name Enemic extends Personatge

onready var jugador: KinematicBody2D = get_tree().current_scene.get_node("P_Jugador")

func perseguir_jugador() -> void:
	var seguentDireccio: Vector2 = position.direction_to(jugador.position)
	direccio = seguentDireccio
	if seguentDireccio.x > 0 and anim_sprite.flip_h:
		anim_sprite.flip_h = false
	elif seguentDireccio.x < 0 and not anim_sprite.flip_h:
		anim_sprite.flip_h = true

