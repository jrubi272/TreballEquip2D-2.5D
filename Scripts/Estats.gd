class_name Estats extends Node

var estats: Dictionary = {}
var estat_anterior: int = -1
var estat: int = -1 setget set_state

onready var pare: Personatge = get_parent()
onready var anim_player: AnimationPlayer = pare.get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	if estat != -1:
		comportament_estats(delta)
		var transicio: int = transicions()
		if transicio != -1:
			comportament_estats(transicio)


func comportament_estats(delta: float) -> void:
	pass
	
	
func transicions() -> int:
	return -1
func _add_state(new_state: String) -> void:
	estats[new_state] = estats.size()
	
	
func set_state(nou: int) -> void:
	_exit_state(estat)
	estat_anterior = estat
<<<<<<< HEAD
	estat = nou
	afegir_estats(estat_anterior, estat)


func afegir_estats(estat_anterior: int, nou: int) -> void:
=======
	estat = new_state
	_enter_state(estat_anterior, estat)
func _enter_state(estat_anterior: int, _new_state: int) -> void:
>>>>>>> 098f2841afe08462eb839838b4e2308ca4b6d653
	pass
	
	
func _exit_state(_state_exited: int) -> void:
	pass
