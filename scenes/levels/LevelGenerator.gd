extends RigidBody2D

var cooldown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
# If the player crosses the X value of this, move it forward and paste in the next level piece.
func _process(_delta):
	pass

var is_triggered = false
func _on_area_2d_body_entered(body):
	if body.name == "Player" and is_triggered == false:  # Check if the body is the player
		#is_triggered = true
		global_position.x = global_position.x + 512
		print("generateLevel")
		call_deferred("add_scene_to_level")

func add_scene_to_level():
	# Load the tilemap for the generated levels. Make it random between level2 - level4
	var tilemap_scene = load("res://scenes/levels/generate_levels/level" + str(randi() % (4 - 2 + 1) + 2) + ".tscn")
	var tilemap_instance = tilemap_scene.instantiate()
	tilemap_instance.global_position = Vector2(global_position.x, global_position.y)
	tilemap_instance.z_index = -1
	get_tree().current_scene.get_node("../TestLevel/LoadedLevels").add_child(tilemap_instance)
		
