extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var itemList = 0
export var price = 0
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _pressed():
	descuentoSiTengo()
	
	get_node("Audio").play();
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func descuentoSiTengo():
	if (Puntaje.coins >= price):
		Puntaje.descontarCoins(price)
		Puntaje.skinNro = itemList
		print ("dinero restante: " + str(Puntaje.coins))
		get_tree().change_scene("res://Escena/main.tscn")
	else:
		print ("Dinero Insuficiente")
