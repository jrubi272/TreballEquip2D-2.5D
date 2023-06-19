class_name Personatge extends KinematicBody2D

signal mort
signal danyat

#constants
const FRICTION: float = 0.15

#export variables
export(int) var accel:= 40
export(int) var max_vel:= 100
export(int) var vides = 2

#Variables/Atributs
var direccio: Vector2 = Vector2.ZERO #inicialitzat a coordenades (0,0)
var velocitat: Vector2 = Vector2.ZERO
var potMoure: bool = true

onready var anim_sprite: AnimatedSprite = get_node("AnimatedSprite")
onready var estats_pers: Node = get_node("Estats")


func _physics_process(delta: float) -> void:
	velocitat = move_and_slide(velocitat)
	velocitat = lerp(velocitat, Vector2.ZERO, FRICTION)#per a disminuir gradualment la velocitat del personatge

func moure(max_veloc: int):
	if potMoure:
		direccio = direccio.normalized()
		if max_veloc > 100: #per la gestio de l'augment de velocitat al P_Jugador, ja que nomes l'afecta a ell
			velocitat += direccio * 1.6
		velocitat += direccio * accel #aplicam el moviment al personatge
		velocitat = velocitat.limit_length(max_veloc)#per a limitar la velocitat del personatge
 

func rebre_dany(dany: int, dir: Vector2, forca: int) -> void:
	if estats_pers.estat != estats_pers.estats.danyar:
		vides -= dany
		emit_signal("danyat")
		if vides > 0: 
			estats_pers.colocar_estat(estats_pers.estats.danyar)
			velocitat += dir * forca
			print ("danyat")
		elif vides == 0:
			estats_pers.colocar_estat(estats_pers.estats.mort)
			velocitat += direccio * forca * 2
			emit_signal("mort")
