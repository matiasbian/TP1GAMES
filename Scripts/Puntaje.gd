extends Node

var puntaje = 0
var coins = 100
var skinNro = 0
func _ready():

	pass

func descontarCoins(cant):
	coins -= cant
func setSkin(nro):
	skinNro = nro
