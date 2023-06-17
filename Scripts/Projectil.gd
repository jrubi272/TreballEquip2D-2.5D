class_name Projectil extends Hitbox


export var velocitat:= 400
export var dany = 1

var direccio:= Vector2()
var sortit = false


func ini(dir:Vector2, posInicial:Vector2):
	position = posInicial
	direccio = dir
	rotation += dir.angle() + PI/4
	

func _physics_process(delta):
	position += direccio * velocitat * delta


func _on_Projectil_body_exited(body):
	if not sortit:
		sortit = true
		set_collision_mask_bit(0, true)
		set_collision_mask_bit(1, true)
		set_collision_mask_bit(2, true)
		set_collision_mask_bit(3, true)

func colisionar(body: KinematicBody2D) -> void:
	if sortit:
		if body != null:
			body.rebre_dany(danys, direccio_empenta, forca_empenta)
		queue_free()
