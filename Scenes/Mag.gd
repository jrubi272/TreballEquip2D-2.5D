class_name Mag extends Enemic

const PROJECTIL:= preload("res://Projectil.gd")

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
			pass

func allunyarse():
	pass
