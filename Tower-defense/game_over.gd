extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_pressed():
	var game_scene = load("res://main_menu.tscn").instantiate()
	add_child(game_scene)


func _on_quit_game_pressed():
	get_tree().quit()
