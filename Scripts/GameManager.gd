extends Node2D
export var list = []
export var rango1X= 0
export var rango2X= 0
export var cantidadMax = 0
var personaje
var puntaje
var text
var zanas
export var distancia= 0
var yDePlataformas = 0
var scene = load("res://Escena/PanelPerdiste.tscn") 
var scene_instance = scene.instance()
var audio
var audioGameOver
func _ready():
	

	rango2X = get_viewport().size.x +50
	text = get_node("CanvasLayer/VBoxContainer/MarginContainer/Label")
	zanas = get_node("CanvasLayer/VBoxContainer/MarginContainer/HBoxContainer/Label2")
	personaje = get_node("Personaje")
	ponerPrimeraPlataforma()
	yDePlataformas = personaje.position.y
	cantidadDePlataformas(8)
	


func _process(delta):
	
	Puntaje()

	
func cantidadDePlataformas(cant):
	for i in cant :
		Plataformas(100)

func MostrarMenuMeMori():
	saveScore()
	
	get_tree().change_scene("res://Escena/PanelPerdiste.tscn")
		

func saveScore():
	Puntaje.coins += Puntaje.coinsTemp
	Puntaje.coinsTempop = Puntaje.coinsTemp
	Puntaje.coinsTemp = 0
	#Puntaje.maxScorep()
	Save.saveCoins(Puntaje.maxScore,Puntaje.coins,Puntaje.yaComprados,Puntaje.skinNro)
	
func Puntaje():
	zanas.text = str(Puntaje.coinsTemp)
	if personaje.tiempoDeCaida == 0:
		Puntaje.puntaje = personaje.position.y/50
		if (Puntaje.puntaje < 0):
			text.text = str(-(int(Puntaje.puntaje)))

func ponerPrimeraPlataforma(): #  en el ready poner siempre esto
	var scene_instance = list[1]
	scene_instance = scene_instance.instance()
	scene_instance.set_name("Plataforma")
	add_child(scene_instance)
	scene_instance.translate(Vector2(personaje.position.x,personaje.position.y + 100))	
	scene_instance.get_node("Audio").volume_db = -20

#func _on_timer_timeout():
#	Plataformas()
#	print("mas plataformas")
	
		
	
func Plataformas(facilidadInicial = 0): #Esta medio fiero	, podria estar mejor 
	for i in cantidadMax :
		var scene_instance = list[int(DameAleatorio(1,list.size()))]
		scene_instance = scene_instance.instance()
		scene_instance.set_name("Plataforma")
		add_child(scene_instance)
		scene_instance.translate(Vector2 (DameAleatorio( rango1X + 200,rango2X),DameAleatorio(yDePlataformas ,yDePlataformas -10)))
		yDePlataformas -= distancia - facilidadInicial


		

		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))