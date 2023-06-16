extends CanvasLayer


signal mort


func _ready():
	$BarraVida.value = 100


func actualitzar_vida(nVides):
	if nVides == -1 and $BarraVida.value >= 25:
		$BarraVida.value -= 25
		if $BarraVida.value == 0:
			emit_signal("mort")
	elif nVides == 1 and $BarraVida.value < 100:
		$BarraVida.value += 25
