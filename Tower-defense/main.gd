extends Node2D

var map_node
var tower_node

var build_mode = false
var build_valid = false
var build_location
var build_type
@onready var mapo = $Track




#func _physics_process(_delta):
	#
	#var mouse_pos = get_global_mouse_position()
	#var tile_mouse_pos = mapo.local_to_map(mouse_pos)
#
	#



func _ready():
	map_node = get_node("Map1")
	tower_node = get_node("tower")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.pressed.connect(initiate_build_mode.bind(i.name))
		

#func _unhandled_input(event):
	#if event.is_action_released("ui_cancel") and build_mode == true:
		#print("Cancel")
		#cancel_build_mode()
	#if event.is_action_released("ui_accept") and build_mode == true:
		#print("Accept")
		#verify_and_build()
		#cancel_build_mode()
		#
		
func get_command():
	if  Input.is_action_just_pressed("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if Input.is_action_just_pressed("ui_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()

func _process(delta):
	if build_mode:
		update_tower_preview()
		get_command()
		
func initiate_build_mode(tower_type):
	#if build_mode: CAN be used to fix my clone issue
		#return
	build_type = tower_type + "T1"
	build_mode = true
	get_node("UI").set_tower_preview(build_type,get_global_mouse_position())
	#ok
	

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tile = map_node.get_node("TowerExclusion").local_to_map(mouse_position)
	var title_position = map_node.get_node("TowerExclusion").map_to_local(current_tile)
	
	

	if map_node.get_node("TowerExclusion").get_cell_source_id(0, current_tile):
		get_node("UI").update_tower_preview(title_position, "fff")
		build_valid = true 
		build_location = title_position
		
		
	
	else:
		get_node("UI").update_tower_preview(title_position, "000")
		build_valid = false

func cancel_build_mode():
	build_mode = false 
	build_valid = false 
	get_node("UI/TowerPreview").queue_free()
	
func verify_and_build():
	if build_valid:
		var distance = 0
		var new_distance = 0
		var new_tower = load("res://" + build_type + ".tscn").instantiate()
		new_tower.position = build_location
		new_tower.position.x = new_tower.position.x+2
		new_tower.position.y = new_tower.position.y+1
		tower_node.add_child(new_tower, true)
		
			
	

