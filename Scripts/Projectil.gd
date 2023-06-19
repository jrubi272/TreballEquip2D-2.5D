class_name Projectil extends Hitbox


export var velocitat:= 400
export var dany = 1

var direccio:= Vector2()


func ini(dir:Vector2, posInicial:Vector2):
	position = posInicial
	direccio = dir
	rotation += dir.angle() + PI/4
	

func _physics_process(delta):
	position += direccio * velocitat * delta


func colisionar(body: KinematicBody2D) -> void:
	if body != null:
		body.rebre_dany(danys, direccio_empenta, forca_empenta)
	queue_free()
