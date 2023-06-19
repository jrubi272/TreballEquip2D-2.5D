class_name Ogre extends KinematicBody2D

onready var jugador: KinematicBody2D = get_node("Hitbox")


func _process(delta):
	hitbox.direccio_empenta = velocitat.normalized()
