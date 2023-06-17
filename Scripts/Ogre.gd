class_name Ogre extends Enemic

onready var hitbox: Area2D = get_node("Area2D")


func _process(delta):
	hitbox.direccio_empenta = velocitat.normalized()
