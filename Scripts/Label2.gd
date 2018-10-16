extends Label

var gameManager
var audio
var timer
func _ready():
	audio = get_node("AudioStreamPlayer")
	timer = Timer.new()
	timer.wait_time = 4
	add_child(timer)
	timer.connect("timeout",self,"pararCancion")
	timer.start()
	gameManager = get_parent().get_parent()
	self.text = "Puntaje " + String(-int((Puntaje.puntaje)))


func pararCancion():
	audio.stop()