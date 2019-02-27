extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("AnimationPlayer").play("Idle")
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
		Puntaje.coinsTemp += 1
		reproduzcoAnim(body)
	get_parent().remove_child(self)

func reproduzcoAnim(body):
	var ui = body.get_parent().get_node("CanvasLayer")
	if (ui != null):
		ui.get_node("AnimationPlayer").play("+1")
