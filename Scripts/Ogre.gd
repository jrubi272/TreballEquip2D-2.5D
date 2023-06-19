class_name Ogre extends Enemic

onready var hitbox: Area2D = get_node("Hitbox")


func _process(delta):
	hitbox.direccio_empenta = velocitat.normalized()
