extends KinematicBody2D
class_name Personatge

#constants
const FRICTION: float = 0.15

#export variables
export(int) var accel:= 40
export(int) var max_vel:= 100

#Variables/Atributs
var direccio: Vector2 = Vector2.ZERO
var velocitat: Vector2 = Vector2.ZERO
onready var anim_sprite: AnimatedSprite = get_node("AnimatedSprite")

func _physics_process(delta: float) -> void:
	velocitat = move_and_slide(velocitat)
	velocitat = lerp(velocitat, Vector2.ZERO, FRICTION)#per a disminuir gradualment la velocitat del personatge

func moure():
	direccio = direccio.normalized()
	velocitat += velocitat * accel
	velocitat = velocitat.clamped(max_vel) #per a limitar la velocitat del personatge
