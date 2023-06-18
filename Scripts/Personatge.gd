class_name Personatge extends KinematicBody2D

signal mort

#constants
const FRICTION: float = 0.15

#export variables
export(int) var accel:= 40
export(int) var max_vel:= 100
export(int) var vides = 2

#Variables/Atributs
var direccio: Vector2 = Vector2.ZERO #inicialitzat a coordenades (0,0)
var velocitat: Vector2 = Vector2.ZERO
var _posInicial: Vector2
var potMoure: bool = true

onready var anim_sprite: AnimatedSprite = get_node("AnimatedSprite")
onready var estats_pers: Node = get_node("Estats")


func _physics_process(delta: float) -> void:
	velocitat = move_and_slide(velocitat)
	velocitat = lerp(velocitat, Vector2.ZERO, FRICTION)#per a disminuir gradualment la velocitat del personatge

func moure(max_veloc: int):
	if potMoure:
		direccio = direccio.normalized()
		if max_veloc > 100:
			velocitat += direccio * 1.6
		velocitat += direccio * accel #aplicam el moviment al personatge
		velocitat = velocitat.clamped(max_veloc) #per a limitar la velocitat del personatge
 
func actualitzar_vides(nVides, direccio):
	vides += nVides
	if nVides > 0:
		pass #gestionar cuando todavia vive
	else:
		pass #gestionar cuando muere

func rebre_dany(dany: int, dir: Vector2, forca: int) -> void:
	if estats_pers.estat != estats_pers.estats.danyar:
		vides -= dany
		if vides > 0: 
			estats_pers.colocar_estat(estats_pers.estats.danyar)
			velocitat += dir * forca
		elif vides == 0:
			estats_pers.colocar_estat(estats_pers.estats.mort)
			velocitat += direccio * forca * 2
			emit_signal("mort")

func set_pos_inicial(pos:Vector2):
	position = pos
	_posInicial = pos
