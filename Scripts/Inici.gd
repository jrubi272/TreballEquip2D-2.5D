extends Node2D


const JOC:= preload("res://Scenes/Joc.tscn")

func _on_Start_pressed():
	get_tree().change_scene_to(JOC)

func _on_Exit_pressed():
	get_tree().quit()
