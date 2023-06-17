extends Node2D

#alomejor hacer export var de n_enemigos iniciales o de tiempo de ronda para que haya
#alguna variable en el inspector

func _init() -> void:
	randomize()
	
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)

func _ready():
	$P_Jugador/Camera2D.limit_bottom = 342
	$P_Jugador/Camera2D.limit_left = -102
	$P_Jugador/Camera2D.limit_right = 532
	$P_Jugador/Camera2D.limit_top = -22

func canviar_nivell2():
	$P_Jugador/Camera2D.limit_bottom = 317
	$P_Jugador/Camera2D.limit_left = -52
	$P_Jugador/Camera2D.limit_right = 508
	$P_Jugador/Camera2D.limit_top = 0
	#$P_Jugador.position = $Navigation2D/Escenari2/puntInici.position

func canviar_nivell3():
	$P_Jugador/Camera2D.limit_bottom = 300
	$P_Jugador/Camera2D.limit_left = -28
	$P_Jugador/Camera2D.limit_right = 485
	$P_Jugador/Camera2D.limit_top = 0
	#$P_Jugador.position = $Navigation2D/Escenari3/puntInici.position

func canviar_nivell4():
	$P_Jugador/Camera2D.limit_bottom = 340
	$P_Jugador/Camera2D.limit_left = 2
	$P_Jugador/Camera2D.limit_right = 452
	$P_Jugador/Camera2D.limit_top = 0
	#$P_Jugador.position = $Navigation2D/Escenari4/puntInici.position

