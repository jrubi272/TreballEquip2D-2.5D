class_name Estats extends Node

var estats: Dictionary = {}
var estat_anterior: int = -1
var estat: int = -1 setget colocar_estat

onready var pare: Personatge = get_parent()
onready var anim_player: AnimationPlayer = pare.get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	if estat != -1:
		comportament_estats(delta)
		var transicio: int = transicionar()
		if transicio != -1:
			colocar_estat(transicio)


func comportament_estats(_delta: float) -> void:
	pass
	
	
func transicionar() -> int:
	return -1
	
func afegir_estat(new_state: String) -> void:
	estats[new_state] = estats.size()
	
	
func colocar_estat(new_state: int) -> void:
	sortir_estat(estat)
	estat_anterior = estat
	estat = new_state
	entrar_estat(estat_anterior, estat)
	
func entrar_estat(estat_anterior: int, nou: int) -> void:
	pass
	
	
func sortir_estat(_state_exited: int) -> void:
	pass
