class_name Mag extends Enemic

const PROJECTIL:= preload("res://Scenes/Projectil.tscn")

const Max_Distancia_Jugador:= 80
const Min_Distancia_Jugador:= 40

var potAtacar= true
var distanciaJugador


func _on_TimerCami_timeout():
	if is_instance_valid(jugador):
		distanciaJugador = (jugador.position - global_position).length()
		if distanciaJugador > Max_Distancia_Jugador:
			obtenirCamiJugador()
		elif distanciaJugador < Min_Distancia_Jugador:
			allunyarse()
		else:
			$RayCast2D.cast_to = jugador.position - global_position
			if potAtacar and not $RayCast2D.is_colliding():
				potAtacar = false
				$AnimationPlayer.play("Atacar")
				$AnimAtacar.start()
	else:
		$TimerCami.stop()
		cami = []
		direccio = Vector2.ZERO

func allunyarse():
	var direccio = (global_position - jugador.position).normalized()
	cami = localitzacio.get_simple_path(global_position, global_position + direccio*100)
	

func disparar():
	var proj = PROJECTIL.instance()
	proj.ini(global_position, (jugador.position - global_position).normalized())
	get_tree().current_scene.add_child(proj)

func _on_TimerAtac_timeout():
	potAtacar = true


func _on_AnimAtacar_timeout():
	disparar()
	$TimerAtac.start()
