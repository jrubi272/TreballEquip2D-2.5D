extends CanvasLayer


signal mort
signal augmentarVel
signal buffElegit
signal menysEnems
signal mesVida

func _ready():
	$BarraVida.value = 100


func actualitzar_vida(nVides):
	if nVides == -1 and $BarraVida.value >= 25:
		$BarraVida.value -= 25
		if $BarraVida.value == 0:
			emit_signal("mort")
	elif nVides == 1 and $BarraVida.value < 100:
		$BarraVida.value += 25


func _on_mesVida_pressed():
	actualitzar_vida(1)
	emit_signal("buffElegit")
	emit_signal("mesVida")

func _on_mesVel_pressed():
	emit_signal("augmentarVel")
	emit_signal("buffElegit")

func _on_menysEnems_pressed():
	emit_signal("buffElegit")
	emit_signal("menysEnems")
