extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 2 == 0:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	#check if the body that entered the area is the player and checks if they are Boosting.
	if body.name == "Player" and body.is_boosting: #checks if Player is Boosting from Player.gd script.
		# Break the rock animation / sound.
		$AnimationPlayer.play("Break") #TODO add sound
		get_node("../../../DataManager").player_data["rocks_broken"] += 1
		#debug info.
		print("Player Boosted through a Rock")
	elif body.name == "Player" and not body.is_boosting: #if the player doesn't boost through the rock. Kill the player.
		body.player_death() #calls player_death() from the Player.gd

# Once the animation (Rock: "Break") has completed. 
func _on_animation_player_animation_finished(anim_name):
	# Remove the rock from the game.
	queue_free()
