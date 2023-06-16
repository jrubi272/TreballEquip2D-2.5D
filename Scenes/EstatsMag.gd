class_name EstatsMag extends Estats


func _init():
	_add_state("idle")
	_add_state("caminar")
	_add_state("atacar")
	
func _ready():
	set_state(estats.caminar)
	
