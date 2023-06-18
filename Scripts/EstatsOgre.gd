class_name EstatsOgre extends Estats


func _init():
	afegir_estat("caminar")
	afegir_estat("danyar")
	afegir_estat("mort")

func _ready():
	colocar_estat(estats.caminar)
	
func comportament_estats(_delta: float) -> void:
	if estat == estats.caminar:
		pare.perseguir_jugador()
		pare.moure(90)

func entrar_estat(estat_anterior: int, nou: int) -> void:
	match nou:
		estats.caminar:
			anim_player.play("Caminar")
		estats.danyar:
			anim_player.play("Danyar")
		estats.mort:
			anim_player.play("Mort")

func transicionar() -> int:
	match estat:
		estats.danyar:
			if not anim_player.is_playing():
				return estats.caminar
	return -1
	
