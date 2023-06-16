class_name EstatsOgre extends Estats


func _init():
	afegir_estat("caminar")

func _ready():
	colocar_estat(estats.caminar)
	
func comportament_estats(_delta: float) -> void:
	if estat == estats.caminar:
		pare.perseguir_jugador()
		pare.moure()
	
func entrar_estat(estat_anterior: int, nou: int) -> void:
	match nou:
		estats.caminar:
			anim_player.play("Caminar")
	
