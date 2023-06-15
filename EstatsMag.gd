extends Estats


func _init() -> void:
	_add_state("Idle")
	_add_state("Atacar")
	_add_state("Caminar")
	
func _ready() -> void:
	set_state(estats.move)

func comportament_estats(delta) -> void:
	if estat == estats.move:
		pare.chase()
		pare.move()
		
func transicions(): 
	pass
