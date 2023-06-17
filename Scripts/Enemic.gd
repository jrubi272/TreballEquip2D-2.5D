class_name Enemic extends Personatge

var jugador: KinematicBody2D
var timer: Timer
var localitzacio: Navigation2D
var cami: PoolVector2Array


func _ready():
	jugador = get_tree().current_scene.get_node("P_Jugador")
	timer = get_node("Timer")
	localitzacio = get_tree().current_scene.get_node("Navigation2D")

func perseguir_jugador() -> void:
	if cami:
		var seguentLloc = cami[0] - global_position
		var distanciaSeguentLloc = seguentLloc.length()
		if distanciaSeguentLloc < 3:
			cami.remove(0)
			if not cami:
				return
			direccio = seguentLloc
			if seguentLloc.x > 0 and anim_sprite.flip_h:
				anim_sprite.flip_h = false
			elif seguentLloc.x < 0 and not anim_sprite.flip_h:
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
