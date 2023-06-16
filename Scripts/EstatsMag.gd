class_name EstatsMag extends Estats


func _init():
	afegir_estat("idle")
	afegir_estat("caminar")
	afegir_estat("atacar")
	
func _ready():
	colocar_estat(estats.caminar)
	
