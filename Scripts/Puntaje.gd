extends Node

var puntaje = 0
var maxScore = 0
var coinsTemp = 0
var coinsTempop = 0
var coins = 1
var skinNro = 0
var yaComprados = []
func _ready():
	var save_game = File.new()
	if (not save_game.file_exists("user://saved_game.sav")):
		return
	var data = Save.loadCoins()
	coins = data.coins
	maxScore = data.highScore
	yaComprados = data.skinList
	skinNro = data.skA

func descontarCoins(cant):
	coins -= cant
func setSkin(nro):
	skinNro = nro

func maxScorep():
	if (-puntaje > maxScore):
		maxScore = int (-puntaje)
	print ("PUNTAJE: " + str(puntaje ) + "SCORE MAX: " + str(maxScore)) 
