extends Actor

var push_force = 40

var jumped = 0

var is_boosting = false

var coins = 0

var was_on_floor = false

func _ready():
	speed = 300 * 60 # Base players speed.
	jump_velocity = -375.0 # Base player jump height velocity. (Note: GDScript uses negatives to add gravity.)
	velocity.x = 1 # Set players base X velocity so that they will be moving automatically.
	get_node("Broom").texture = load("res://images/sprites/brooms/" + str(get_node("../DataManager").player_data["current_broom"]))

func _physics_process(delta):
	
	## Coins Additional Speed Limitation and Calculation.
	# coins are calcualted into the speed of the player.
	# if the player has 50 coins or less.
	if coins <= 50:
		# the players speed will be calculated this way.
		speed = (300 * 60) + (coins * 2)
	# if the player has more than 50 coins. Put a limit on how much of a speed increase they will get.
	else:
		# player's speed at 50 coins and above.
		speed = 400 * 60
	
	
	## Check For Player Stopped OR Player Falls Off the Map.
	#checks if the player hit a wall and stopped or fell off the map.
	# if the player stops moving OR they've fallen too low off the camera.
	if velocity.x == 0 or position.y >= 400: 
		player_death() # kill the player.
		print("player died.") # debug info.
		
	
		
	## Add the gravity.
	# adds a gravity force on the player.
	velocity.y += gravity * delta + 2
	
	
		
	if is_on_floor() and not was_on_floor:
		jumped = 0
		
	was_on_floor = is_on_floor()
	
	
	# The DashTimer is used to determine how long the player can Boost for.
	# if timer is going,we're boosting. 
	if not $DashTimer.is_stopped(): 
		# Don't change y. So the player doesn't fall downward when boosting.
		velocity.y = 0 * delta
		
	## Handle Jump.
	# If the player presses Spacebar AND The DashTimer is stopped (So we're not boosting) AND (We're either on the floor OR We've jumped less than twice)
	# then you may jump.
	if Input.is_action_just_pressed("ui_accept"):
		player_jump()
	
	## Handle Boosting/Dashing
	# If the player Just pressed the Shift key, perform the boost.
	if Input.is_action_just_pressed("Shift"):
		player_boost()
		
	# if the DashTimer is going, we're boosting currently.
	if not $DashTimer.is_stopped():
		velocity.x = (5  * speed) * delta # set boosting speed for this frame.
		$AnimationPlayer.play("Move") #add boosting animaiton
		is_boosting = true # set boosting to true so we can check this when needed.
	
	# if the player isn't currently boosting..
	# set the player's movement to normal speed for this frame.
	else:
		velocity.x = (1  * speed) * delta # this applies a constant movement to the player so they never stop moving. Normal speed.
		$AnimationPlayer.play("Move") # play movement animation.
		is_boosting = false # set that we aren't boosting so we can check this when needed.

	# Handle for double jump. If player is on the ground, reset the double jump counter.
	
	
	move_and_slide() #perform the movement.
			
			
# when the player dies. - Called by other functions.
func player_death():
	# Show the DeathScreen.
	get_node("../OnScreen/DeathScreen").visible = true
	get_node("../OnScreen/DeathScreen/DeathScreenCoinCounter").text = str(coins)
	get_node("../DataManager").player_data["coins"] += coins
	get_node("../DataManager").player_data["deaths"] += 1
	get_node("../DataManager").player_data["total_coins_collected"] += coins
	get_node("../DataManager").save_data()
	# Pause the game so it stops running completely.
	get_tree().paused = true
	
# When the player collects a coin. - Called from other functions. 
func coin_collected():
	# Add one coin to the coins total
	coins += 1
	# Update the on screen coin counter total.
	get_node("../OnScreen/CoinCounter").text = str(coins)
	
	
func player_jump():
	if $DashTimer.is_stopped() and jumped < 2:
		# set the players y velocity to make them jump this frame.
		velocity.y = jump_velocity
		jumped += 1 #count that the player jumped.
		print("Player Jump Count: " + str(jumped))
	
	
func player_boost():
		velocity.x = (5  * speed) # set the players speed to the boosting/dashing speed
		$DashTimer.start() # start a timer to time for how long the speed will be increased.
		$AnimationPlayer.play("Move") #TODO: add a dashing animation.
		is_boosting = true # set that the player is currently boosting so we can check this when needed.
