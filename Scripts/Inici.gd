extends Node2D


const JOC:= preload("res://Scenes/Joc.tscn")

func _init() -> void:
	
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)


func _on_Start_pressed():
	get_tree().change_scene_to(JOC)

func _on_Exit_pressed():
	get_tree().quit()
