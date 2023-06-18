extends Estats

export var max_vel_jug = 100

func _init() -> void:
	afegir_estat("Idle")
	afegir_estat("Move")
	afegir_estat("danyar")
	afegir_estat("mort")
	
	
func _ready() -> void:
	colocar_estat(estats.Idle)


func comportament_estats(_delta: float) -> void:
	if estat == estats.Idle or estat == estats.Move:
		pare.get_input()
		pare.moure(max_vel_jug)

func entrar_estat(_previous_state: int, nou: int) -> void:
	match nou:
		estats.Idle:
			anim_player.play("Idle")
		estats.Move:
			anim_player.play("Move")
		estats.danyar:
			anim_player.play("Hurt")
		estats.mort:
			anim_player.play("Dead")

func transicionar() -> int:
	match estat:
		estats.Idle:
			if pare.velocitat.length() > 10:
				return estats.Move
		estats.Move:
			if pare.velocitat.length() < 10:
				return estats.Idle
		estats.danyar:
			if not anim_player.is_playing():
				return estats.Idle
	return -1
