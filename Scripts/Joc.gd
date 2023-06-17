extends Node2D

#alomejor hacer export var de n_enemigos iniciales o de tiempo de ronda para que haya
#alguna variable en el inspector

func _init() -> void:
	randomize()
	
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)




