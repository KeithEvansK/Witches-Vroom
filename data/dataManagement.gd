extends Node

## Player Data
# coins : The number of coins the player has collected and has available to spend.
# deaths : The number of times the player has died.
# rocks_broken : The number of times the player has broken a rock.
# total_coins_collected : The total number of coins the player has ever collected.

var player_data = {
	"coins": 0,
	"deaths": 0,
	"rocks_broken": 0,
	"total_coins_collected": 0,
	"current_skin": "Purple_Witch.png",
	"current_broom": "Starter_Broom.png",
	"owned_skins": ["Purple_Witch.png"],
	"owned_brooms": ["Starter_Broom.png"]
}

var path = "user://player_data.json"

func _ready():
	#save_data()
	load_data()
		
		
func save_data():
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file != null:
		print("Save file opened.")
		print("Saving..")
		file.store_var(player_data)
		print("Data Saved: \n" + str(player_data)) 
		file.close()
		print("Save file closed.")
	else:
		print("Failed to save the file.")
		
		
func load_data():
	var file = FileAccess.open(path, FileAccess.READ)
	if file != null:
		var contents = file.get_var()
		for key in contents.keys():
			player_data[key] = contents[key]
		file.close()
		print("Loaded Contents:" + str(contents))
