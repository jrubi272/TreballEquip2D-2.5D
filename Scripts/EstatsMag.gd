<<<<<<< Updated upstream
class_name EstatsMag extends Estats


=======
<<<<<<< HEAD
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
=======
class_name EstatsMag extends Estats


>>>>>>> Stashed changes
func _init():
	_add_state("idle")
	_add_state("caminar")
	_add_state("atacar")
	
func _ready():
	set_state(estats.caminar)
	
<<<<<<< Updated upstream
=======
>>>>>>> 098f2841afe08462eb839838b4e2308ca4b6d653
>>>>>>> Stashed changes
