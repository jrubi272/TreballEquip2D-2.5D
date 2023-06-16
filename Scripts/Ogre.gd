class_name Ogre extends Enemic



func _on_Area2D_body_entered(body):
	if body.has_method("sumar_vides"):
		body.sumar_vides(-1, velocitat).normalized()
	else:
		queue_free()
