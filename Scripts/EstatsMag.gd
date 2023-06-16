class_name EstatsMag extends Estats


func _init():
	_add_state("idle")
	_add_state("caminar")
	_add_state("atacar")
	
func _ready():
	set_state(estats.caminar)
	
func comportament_estats(delta: float) -> void:
	if estat == estats.caminar:
		pare.perseguir_jugador()
		pare.moure()

#func transicions() -> int:
#	match estat:
#		estats.idle:
#			if pare.distanciaJugador > pare.Max_Distancia_Jugador or pare.distanciaJugador < pare.Min_Distancia_Jugador:
#				return estats.caminar
#		estats.caminar: 
#			if pare.distanciaJugador < pare.Max_Distancia_Jugador or pare.distanciaJugador > pare.Min_Distancia_Jugador:
#				return estats.idle
#		estats.atacar:
#			if not anim_player.is_playing():
#				return estats.caminar
#	return -1
	
func afegir_estats(estat_anterior: int, nou: int) -> void:
	match nou:
		estats.idle:
			anim_player.play("Idle")
		estats.caminar:
			anim_player.play("Caminar")
		estats.atacar:
			anim_player.play("Atacar")
