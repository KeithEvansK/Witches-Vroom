extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	# This process_mode must be set to ensure the button will function even when the game is "paused"
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	# Unpause the game so code will continue.
	get_tree().paused = false
	# reset the scene of the game to restart it at the beginning.
	get_tree().reload_current_scene()
