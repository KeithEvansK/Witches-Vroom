extends CharacterBody2D


func _ready():
	get_node("BroomViewer").texture = load("res://images/sprites/brooms/" + str(get_node("../DataManager").player_data["current_broom"]))
	get_node("SkinViewer").texture = load("res://images/sprites/skins/" + str(get_node("../DataManager").player_data["current_skin"]))


func _physics_process(delta):
	pass

