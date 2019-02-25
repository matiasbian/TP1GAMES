extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func saveCoins(score, tcoins,skins,skinActual):
	print(Puntaje.coins)
	var data = {
    	highScore = score,
    	coins = tcoins,
		skinList = skins,
		skA = skinActual
	}

	var file = File.new()
	if file.open("user://saved_game.sav", File.WRITE) != 0:
    	print("Error opening file")
    	return
		
# Save the dictionary as JSON (or whatever you want, JSON is convenient here because it's built-in)
	file.store_line(to_json(data))
	file.close()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func loadCoins():
	var file = File.new()
	if not file.file_exists("user://saved_game.sav"):
    print("No file saved!")
    return

# Open existing file
	if file.open("user://saved_game.sav", File.READ) != 0:
    	print("Error opening file")
    	return

# Get the data
	var data = {}
	data = parse_json(file.get_line())
	#data.parse_json(file.get_line())
	return data

# Then do what you want with the data