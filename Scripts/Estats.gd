extends Node
class_name Estats

var estats: Dictionary = {}
var estat_anterior: int = -1
var estat: int = -1 setget set_state

onready var pare: Personatge = get_parent()
onready var anim_player: AnimationPlayer = pare.get_node("AnimationPlayer")


func _physics_process(delta: float) -> void:
	if estat != -1:
		_state_logic(delta)
		var transicio: int = _get_transicio()
		if transicio != -1:
			set_state(transicio)


func _state_logic(_delta: float) -> void:
	pass
	
	
func _get_transicio() -> int:
	return -1


func _add_state(new_state: String) -> void:
	estats[new_state] = estats.size()
	
	
func set_state(new_state: int) -> void:
	_exit_state(estat)
	estat_anterior = estat
	estat = new_state
	_enter_state(estat_anterior, estat)


func _enter_state(estat_anterior: int, _new_state: int) -> void:
	pass
	
	
func _exit_state(_state_exited: int) -> void:
	pass

