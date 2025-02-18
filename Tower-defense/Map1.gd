extends Node2D

@onready var hover: TileMap = $HooverMap

func _physics_process(_delta):
	
	var mouse_pos = get_global_mouse_position()
	var tile_mouse_pos = hover.local_to_map(mouse_pos)
	$hover.position=  hover.map_to_local(tile_mouse_pos)
	$hover.position.y += 8
	#var mouse_pos = get_global_mouse_position()
	#var tile_mouse_pos = hover.local_to_map(mouse_pos)
	#$hover.position= (get_global_mouse_position() / 24).floor() * 24
	#print_debug($hover.position)
	
	
