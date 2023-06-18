extends Node2D

#alomejor hacer export var de n_enemigos iniciales o de tiempo de ronda para que haya
#alguna variable en el inspector
const MAG:= preload("res://Scenes/Mag.tscn")
const OGRE:= preload("res://Scenes/Ogre.tscn")


const NIV1:= preload("res://Scenes/Escenari.tscn")
const NIV2:= preload("res://Scenes/Escenari2.tscn")
const NIV3:= preload("res://Scenes/Escenari3.tscn")
const NIV4:= preload("res://Scenes/Escenari4.tscn")

onready var navi = get_node("Navigation2D")

var _Ogres: Array = []
var _Mags: Array = []

var enemics_en_joc = 0
var enemics_inicials = 2
var enemics_per_ronda = 5
var temps_spawn_enemics = 5
var escenari
var esc_xMax 
var esc_xMin
var esc_yMax
var esc_yMin
var lvl : int = 1
var rand = RandomNumberGenerator.new()

func _init() -> void:
	randomize()
	
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)

func _ready():
	rand.randomize()
	$SpawnEnemics.wait_time = temps_spawn_enemics
	$SpawnEnemics.start()
	$HUD/Millores.visible = false
	$HUD.connect("augmentarVel", self, "mesVelJug")
	$HUD.connect("buffElegit", self, "gestio_nivells")
	#gestions pel primer nivell
	$P_Jugador/Camera2D.limit_bottom = 342
	$P_Jugador/Camera2D.limit_left = -102
	$P_Jugador/Camera2D.limit_right = 532
	$P_Jugador/Camera2D.limit_top = -22
	var nivell1 = NIV1.instance()
	navi.add_child(nivell1, true)
	escenari = nivell1
	esc_xMax = 530
	esc_xMin = -100
	esc_yMax = 340
	esc_yMin = 25
	$HUD.actualitzar_vida(-1)
	iniciar_enemics()

func canviar_nivell2():
	
	$P_Jugador.potMoure = true
	$P_Jugador.potMoureEspasa = true
	navi.get_child(0).queue_free()
	var nivell2 = NIV2.instance()
	navi.call_deferred("add_child", nivell2)
	$P_Jugador.set_global_position(nivell2.get_node("puntInici").position)
	$P_Jugador/Camera2D.limit_bottom = 317
	$P_Jugador/Camera2D.limit_left = -52
	$P_Jugador/Camera2D.limit_right = 508
	$P_Jugador/Camera2D.limit_top = 0
	escenari = nivell2
	esc_xMax = 500
	esc_xMin = -50
	esc_yMax = 320
	esc_yMin = 30

func canviar_nivell3():
	
	$P_Jugador.potMoure = true
	$P_Jugador.potMoureEspasa = true
	navi.get_child(0).queue_free()
	var nivell3 = NIV3.instance()
	navi.call_deferred("add_child", nivell3)
	$P_Jugador.set_global_position(nivell3.get_node("puntInici").position)
	$P_Jugador/Camera2D.limit_bottom = 300
	$P_Jugador/Camera2D.limit_left = -28
	$P_Jugador/Camera2D.limit_right = 485
	$P_Jugador/Camera2D.limit_top = 0
	escenari = nivell3
	esc_xMax = 385
	esc_xMin = -30
	esc_yMax = 290
	esc_yMin = 50

func canviar_nivell4():
	
	$P_Jugador.potMoure = true
	$P_Jugador.potMoureEspasa = true
	navi.get_child(0).queue_free()
	var nivell4 = NIV4.instance()
	navi.call_deferred("add_child", nivell4)
	$P_Jugador.set_global_position(nivell4.get_node("puntInici").position)
	$P_Jugador/Camera2D.limit_bottom = 340
	$P_Jugador/Camera2D.limit_left = 2
	$P_Jugador/Camera2D.limit_right = 452
	$P_Jugador/Camera2D.limit_top = 0
	escenari = nivell4
	esc_xMax = 450
	esc_xMin = -50
	esc_yMax = 360
	esc_yMin = 0

func mesVelJug():
	$P_Jugador/Estats.max_vel_jug += 30

func _on_prova_timeout():
	$HUD/Millores.visible = true
	$P_Jugador.potMoure = false
	$P_Jugador.potMoureEspasa = false

func gestio_nivells():
	lvl += 1
	$HUD/Millores.visible = false
	if lvl == 2:
		canviar_nivell2()
	elif lvl == 3:
		canviar_nivell3()
	elif lvl == 4:
		canviar_nivell4()

func iniciar_enemics(): 
	while enemics_en_joc <= enemics_inicials:
		if enemics_en_joc % 2 == 0:
			colocar_enemic("ogre")
		else:
			colocar_enemic("mag")
		enemics_en_joc += 1

func colocar_enemic(tipus:String): 
	var enemic
	if tipus == "ogre":
		enemic = OGRE.instance()
		_Ogres.append(enemic)
	else:
		enemic = MAG.instance()
		_Mags.append(enemic)
	self.add_child(enemic, true)
	var valid:= false
	while not valid:
		var randX = rand.randi_range(-100, 520)
		var randY = rand.randi_range(20, 330)
		var coordenada = Vector2(randX,randY)
		if posValida(coordenada, $P_Jugador.position):
			valid = true
			enemic.position = coordenada

func _on_SpawnEnemics_timeout():
	if enemics_en_joc < enemics_per_ronda:
		if enemics_en_joc % 2 == 0:
			colocar_enemic("ogre")
		else:
			colocar_enemic("mag")
		enemics_en_joc += 1
		$SpawnEnemics.start()
		
func posValida(coordenada:Vector2, posJugador):
	if coordenada.x - posJugador.x < 20 or coordenada.y - posJugador.y < 20:
		return false
	elif not escenari.transitable(coordenada):
		return false
	else:
		return true
