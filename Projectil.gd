class_name Projectil extends Area2D

signal disparat(area)

export var velocitat:= 400
export var dany = 1

var potTocar:= []
var potDisparar:= []
var direccio:= Vector2()


func ini(dir:Vector2, posInicial:Vector2):
	position = posInicial
	direccio = dir
	rotation += dir.angle() + PI/4
	

func _physics_process(delta):
	position += direccio * velocitat * delta

func afegir_porTocar(esser:Node):
	potTocar.append(esser)
	
func afegir_potDisparar(esser:Node):
	potDisparar.append(esser)
	

func _on_Projectil_area_entered(area):
	if area in potTocar:
		emit_signal("disparat", area)
	queue_free()


func _on_Projectil_body_entered(body):
	if not body in potDisparar:
		body.sumar_vides(-1, Vector2.ZERO)
		queue_free()
