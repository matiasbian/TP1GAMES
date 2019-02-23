extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	

	
func colision(personaje):
	Puntaje.coins += 1
	get_parent().remove_child(self)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Zanahoria_body_entered(body):
	var vari = body.get_node("AudioZana")
	if (vari != null):
		vari.play()
		Puntaje.coins += 1
	get_parent().remove_child(self)
