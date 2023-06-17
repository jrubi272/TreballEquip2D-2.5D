extends Node

const NUM_NIVELLS := 4

const NIV1:= preload("res://Scenes/Escenari.tscn")
const NIV2:= preload("res://Scenes/Escenari2.tscn")
const NIV3:= preload("res://Scenes/Escenari3.tscn")
const NIV4:= preload("res://Scenes/Escenari4.tscn")
const JUG:= preload("res://Scenes/P_Jugador.tscn")

var nivells:Array # array de packed scenes corresponents als nivells
#var jugador:P_Jugador  # aquí mantenim el personatge
var nivellActual:int

func _ready():
	nivellActual = 1
	nivells.append(NIV1)
	nivells.append(NIV2)
	nivells.append(NIV3)
	nivells.append(NIV4)
	#jugador = JUG.instance()

func canvia_nivell():
	nivellActual += 1
	if nivellActual > NUM_NIVELLS: 
		nivellActual = 1
	get_tree().change_scene_to(nivells[nivellActual-1])
