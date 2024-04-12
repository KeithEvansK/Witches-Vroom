extends Sprite2D


var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 2 == 0:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# When a player enters the area2D shape.
func _on_area_2d_body_entered(body):
	# Check if the object that entered it's space is the player.
	if body.name == "Player":
		# Call the players script coin_collected() => which will add coin to the total.
		body.coin_collected()
		# debug info.
		print("Coin Collected")
		# Remove this component (the coin) from the game as it is no longer needed.
		queue_free()
