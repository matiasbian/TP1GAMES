extends Node2D
export var porcentajeZanahoria = 50
var zanahoria  = load("res://Prefabs/Zanahoria.tscn") 
var personaje
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	personaje = get_parent().get_node("Personaje")
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) #to process
	timer.wait_time = 5
	timer.start() #to start

func _on_timer_timeout():
	var rand = rand_range(1,101)
	if (rand <= porcentajeZanahoria):
		spawnear()
func spawnear():
	var newZana = zanahoria.instance()
	newZana.set_name("Plataforma")
	add_child(newZana)
	newZana.translate(Vector2(personaje.position.x,personaje.position.y - 500))	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
