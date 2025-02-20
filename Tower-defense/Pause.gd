extends Control
var paused = false
@onready var pause = $"."


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func pause_menu():
	if paused == false:
		get_tree().paused =  true
		pause.show()
	if paused == true:
		get_tree().paused = false 
		pause.hide()
	paused = !paused	
	

func _on_resume_pressed():
	pause_menu()



func _on_quit_game_2_pressed():
	get_tree().quit() 



func _on_main_menu_pressed():
	pause_menu()
	get_tree().change_scene_to_file("res://main_menu.tscn")
