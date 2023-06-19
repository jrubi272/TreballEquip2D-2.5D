class_name Enemic extends Personatge

onready var jugador: KinematicBody2D = get_tree().current_scene.get_node("P_Jugador")
onready var localitzacio: Navigation2D = get_tree().current_scene.get_node("Navigation2D")

func perseguir_jugador() -> void:
	var seguentDireccio: Vector2 = position.direction_to(jugador.position)
	direccio = seguentDireccio
	if seguentDireccio.x > 0 and anim_sprite.flip_h:
		anim_sprite.flip_h = false
	elif seguentDireccio.x < 0 and not anim_sprite.flip_h:
		anim_sprite.flip_h = true

func obtenirCamiJugador():
	cami = localitzacio.get_simple_path(global_position, jugador.position)
