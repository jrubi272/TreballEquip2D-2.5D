class_name Enemic extends Personatge

onready var jugador: KinematicBody2D = get_tree().current_scene.get_node("P_Jugador")
onready var timer: Timer = get_node("Timer")
onready var localitzacio: Navigation2D = get_tree().current_scene.get_node("Navigation2D")
var cami: PoolVector2Array 

func perseguir_jugador() -> void:
	if cami:
		var seguentDireccio: Vector2 = position.direction_to(jugador.position)
		direccio = seguentDireccio
		if seguentDireccio.x > 0 and anim_sprite.flip_h:
			anim_sprite.flip_h = false
		elif seguentDireccio.x < 0 and not anim_sprite.flip_h:
			anim_sprite.flip_h = true


func _on_Timer_timeout():
	if is_instance_valid(jugador):
		obtenirCamiJugador()
	else:
		timer.stop()
		cami = []
		direccio = Vector2.ZERO


func obtenirCamiJugador() -> void:
	cami = localitzacio.get_simple_path(global_position, jugador.position)
