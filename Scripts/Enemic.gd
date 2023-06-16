class_name Enemic extends Personatge

onready var jugador: KinematicBody2D = get_tree().current_scene.get_node("P_Jugador")
onready var localitzacio: Navigation2D = get_tree().current_scene.get_node("Navigation2D")

var cami: PoolVector2Array


func _ready():
	connect("tree_exited", get_parent(), "_on_enemy_killed")

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


func obtenirCamiJugador() -> void:
	cami = localitzacio.get_simple_path(global_position, jugador.position)



func _on_Timer_timeout():
	if is_instance_valid(jugador):
		obtenirCamiJugador()
	else:
		$Timer.stop()
		cami = []
		direccio = Vector2.ZERO
