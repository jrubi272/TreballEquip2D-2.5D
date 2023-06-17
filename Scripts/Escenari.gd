class_name Escenari extends Node2D

onready var tileHerba = get_node("Herba")
onready var tileParts = get_node("PartsDarreraJugador")
onready var tileObj = get_node("Objectes")
onready var tileEscales = get_node("Escales")
onready var tileParets = get_node("Parets")
onready var tilePlantes = get_node("Plantes")

func canviar_collisions(capa:int, valor:bool):
	tileHerba.set_collision_layer_bit(capa, valor)
	tileParts.set_collision_layer_bit(capa, valor)
	tileObj.set_collision_layer_bit(capa, valor)
	tileEscales.set_collision_layer_bit(capa, valor)
	tileParets.set_collision_layer_bit(capa, valor)
	tileEscales.set_collision_layer_bit(capa, valor)

func transitable(coordenada:Vector2):
	pass
