extends Estats


func _init() -> void:
	_add_state("Idle")
	_add_state("Move")
	
	
func _ready() -> void:
	set_state(estats.Idle)


func _state_logic(_delta: float) -> void:
	pare.get_input()
	pare.moure()

func _get_transition() -> int:
	match estat:
		estats.Idle:
			if pare.direccio != Vector2.ZERO:
				return estats.Move
		estats.Move:
			if pare.direccio == Vector2.ZERO:
				return estats.Idle
	return -1

func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		estats.Idle:
			anim_player.play("Idle")
		estats.Move:
			anim_player.play("Move")
