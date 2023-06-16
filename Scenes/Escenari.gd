extends Node2D

var _rnd = RandomNumberGenerator.new()
var _arrayTransitables:= []
var _arrayIntransitables:= []

func crea_escenari(margeX, margeY, nTransit, nIntrans):
	var rectangle:= get_viewport_rect()
	$TileMap.clear()
	# ara toca crear l'escenari a partir dels valor aleatoris generats
	# de moment no mirem que sigui connex 
	situa_tiles(margeX, margeY, nTransit, true, rectangle) # situem tiles transitables
	situa_tiles(margeX, margeY, nIntrans, false, rectangle) # situem tiles no transitables

func situa_tiles(margeX:int, margeY:int, num_tiles:int, transitable:bool, r:Rect2):			 
	for k in range(num_tiles):
		var valid:= false
		while not valid:
			var xRand = _rnd.randi_range(margeX, r.size.x-margeX) # generem punt dins rectangle
			var yRand = _rnd.randi_range(margeY, r.size.y-margeY) # aquest punt ja és espai pantalla (isomètric)
			var coordCella= $TileMap.world_to_map(Vector2(xRand,yRand))
			if not coordCella in $TileMap.get_used_cells():
				valid = true
				var tipusTile := 0 if transitable else 1  # triem el tipus de tile depenent de si volem transitable o no 
				$TileMap.set_cell(coordCella.x, coordCella.y, tipusTile)
				var arr := _arrayTransitables if transitable else _arrayIntransitables # ídem amb array
				arr.append(coordCella)	 # afegim coord. cel·la a array corresponent

func _on_Escenari_ready():
	_rnd.randomize()
