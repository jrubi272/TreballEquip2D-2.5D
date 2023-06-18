class_name Escenari extends Node2D

onready var tileHerba = get_node("Herba")
onready var tileParts = get_node("PartsDarreraJugador")
onready var tileObj = get_node("Objectes")
onready var tileEscales = get_node("Escales")
onready var tileParets = get_node("Parets")
onready var tilePlantes = get_node("Plantes")


func transitable(coordenada:Vector2):
	var aux = $Herba.world_to_map(coordenada)
	if aux in $Herba.get_used_cells():
		return true
		return true
