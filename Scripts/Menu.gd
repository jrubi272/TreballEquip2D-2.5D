extends Node2D

signal reintentar

func _on_Reintentar_pressed():
	emit_signal("reintentar")


func _on_Sortir_pressed():
	get_tree().quit()
