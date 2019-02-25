extends Label

var gameManager
var audio
var timer
export var esZana = false
func _ready():
	audio = get_node("AudioStreamPlayer")
	timer = Timer.new()
	timer.wait_time = 4
	add_child(timer)
	timer.connect("timeout",self,"pararCancion")
	timer.start()
	gameManager = get_parent().get_parent()
	if (esZana):
		self.text = str(Puntaje.coinsTempop)
	else:
		self.text = "Score " + String(-int((Puntaje.puntaje)))


func pararCancion():
	audio.stop()