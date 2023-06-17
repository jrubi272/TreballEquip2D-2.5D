extends Area2D
class_name Hitbox

export(int) var danys: int = 1
var direccio_empenta: Vector2 = Vector2.ZERO
export(int) var forca_empenta: int = 300

var dintre_cos: bool = false

onready var collision_shape: CollisionShape2D = get_child(0)
onready var timer: Timer = Timer.new()


func _init() -> void:
	var __ = connect("body_entered", self, "_on_body_entered")
	__ = connect("body_exited", self, "_on_body_exited")
	
	
func _ready() -> void:
	assert(collision_shape != null)
	timer.wait_time = 1
	add_child(timer)
	
	
func _on_body_entered(body: PhysicsBody2D) -> void:
	dintre_cos = true
	timer.start()
	while dintre_cos:
		_collide(body)
		yield(timer, "timeout")
	
	
func _on_body_exited(_body: KinematicBody2D) -> void:
	dintre_cos = false
	timer.stop()
	
	
func _collide(body: KinematicBody2D) -> void:
	if body == null or not body.has_method("take_damage"):
		queue_free()
	else:
		body.rebre_dany(danys, direccio_empenta, forca_empenta)
