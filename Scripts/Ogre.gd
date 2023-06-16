class_name Ogre extends Enemic


func _on_Area2D_body_entered(body):
	if body == null or not body.has_method("sumar_vides"):
		queue_free()
	else:
		body.sumar_vides(-1, velocitat.normalized())
