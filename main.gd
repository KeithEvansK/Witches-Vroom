extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	# Switch scene to the main game screen.
	get_tree().change_scene_to_file("res://scenes/levels/TestLevel.tscn")


func _on_button_2_pressed():
	# Close the game.
	get_tree().quit()


func _on_shop_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Shop.tscn")
