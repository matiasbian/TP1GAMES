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
	
	if (yaLoCompre()):
		Puntaje.skinNro = itemList
		Save.saveCoins(Puntaje.puntaje,Puntaje.coins,Puntaje.yaComprados,Puntaje.skinNro)
	else:
		comprarSiSePuede()
		
func yaLoCompre():
	return Puntaje.myHas(itemList,Puntaje.yaComprados)
	
func comprarSiSePuede():
	if (Puntaje.coins >= price):
		Puntaje.descontarCoins(price)
		Puntaje.skinNro = itemList
		get_parent().get_parent().get_node("MarginContainer/HBoxContainer/Label2").text = str(Puntaje.coins)
		print ("dinero restante: " + str(Puntaje.coins))
		if (not Puntaje.myHas(itemList,Puntaje.yaComprados)):
			Puntaje.yaComprados.append(itemList)
			Save.saveCoins(Puntaje.puntaje,Puntaje.coins,Puntaje.yaComprados,Puntaje.skinNro)
			
	else:
		var popu = get_parent().get_parent().get_parent().get_node("NoMoney")
		popu.get_label().align = Label.ALIGN_CENTER
		popu.get_label().valign = Label.VALIGN_CENTER
		popu.popup_centered(Vector2 (300,200))
		print ("Dinero Insuficiente")