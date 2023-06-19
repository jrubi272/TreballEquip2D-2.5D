class_name Escenari extends Node2D

func transitable(coordenada:Vector2):
	var aux = $Herba.world_to_map(coordenada)
	if aux in $Herba.get_used_cells():
		return true
