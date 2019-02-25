extends Node

var puntaje = 0
var maxScore = 0
var coinsTemp = 0
var coinsTempop = 0
var coins = 1
var skinNro = 0
func _ready():
	var save_game = File.new()
	if (not save_game.file_exists("user://saved_game.sav")):
		return
	var data = Save.loadCoins()
	coins = data.coins
	maxScore = data.highScore

func descontarCoins(cant):
	coins -= cant
func setSkin(nro):
	skinNro = nro

func maxScorep(score):
	if (score > maxScore):
		maxScore = score
