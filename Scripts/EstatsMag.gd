class_name EstatsMag extends Estats


func _init():
	afegir_estat("idle")
	afegir_estat("caminar")
	afegir_estat("atacar")
	
func _ready():
	colocar_estat(estats.caminar)
	
func comportament_estats(_delta: float) -> void:
	if estat == estats.caminar:
		pare.perseguir_jugador()
		pare.moure(80)

func transicionar() -> int:
	match estats:
		estats.idle:
			if pare.distanciaJugador > pare.Max_Distancia_Jugador or pare.distanciaJugador < pare.Min_Distancia_Jugador:
				return estats.caminar
		estats.caminar:
			if pare.distanciaJugador < pare.Max_Distancia_Jugador or pare.distanciaJugador > pare.Min_Distancia_Jugador:
				return estats.idle
		estats.atacar:
			if not anim_player.is_playing():
				return estats.caminar
	return -1
	
func entrar_estat(estat_anterior: int, nou: int) -> void:
	match nou:
		estats.idle:
			anim_player.play("Idle")
		estats.caminar:
			anim_player.play("Caminar")
		estats.atacar:
			anim_player.play("Atacar")
	
