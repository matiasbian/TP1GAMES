extends TextureButton

export var panelPerdi = false

func _ready():
	pass



func _pressed():
	get_node("Audio").play();
	get_tree().change_scene("res://Escena/nivel1.tscn")
	soyPanelPerdi()

func soyPanelPerdi():
	get_tree().paused = false 
