extends Node2D

var map_node
var tower_node

var build_mode = false
var build_valid = false
var build_location
var build_type
@onready var mapo = $Track
@onready var score_label = $UI/HUD/NewGame/Label
@onready var enemies_left_label = $UI/HUD/EnemiesLeft/EnemiesLeftLabel
@onready var enemy_spawn = $EnemySpawn
var enemybar = 5
var score = ScoreTracker.enemies_killed
var wave = 1
@onready var life = $UI/HUD/Health/Label
@onready var player = $Player
var hp
var paused = false
@onready var pause = $UI/Pause
var built = false
var coins = 10
@onready var reaa=false
var waiting = false



func _physics_process(_delta):
	hp = player.health
	if score != ScoreTracker.enemies_killed:
		update_money()
		update_enemy_bar()
	life.text = "HP" + str(hp)	
	if hp <= 0:
		game_over()
	score = ScoreTracker.enemies_killed
	score_label.text = "COINS  " + str(coins )
	enemies_left_label.text = "LEFT  " + str(enemybar)
	var mouse_pos = get_global_mouse_position()
	var tile_mouse_pos = mapo.local_to_map(mouse_pos)
	
func update_money():
	coins = coins +1
func money2():
	coins = coins +2
func money3():
	coins = coins +3
	

func update_enemy_bar():

	enemybar = enemybar - 1
	if enemybar <= 0 && wave == 1:
		enemybar = 10
		wave = 2
	if enemybar <= 1 && wave == 2:	
		enemybar = 100
		wave = 3
		

func _ready():
	get_tree().paused =  true
	coins 
	map_node = get_node("Map1")
	tower_node = get_node("tower")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.pressed.connect(initiate_build_mode.bind(i.name))
		

func get_command():
	if  Input.is_action_just_pressed("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if Input.is_action_just_pressed("ui_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()

func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		pause.pause_menu()
	if build_mode:
		update_tower_preview()
		get_command()
	
#func pause_menu():
	#if paused == false:
		#get_tree().paused =  true
		#pause.show()
	#if paused == true:
		#get_tree().paused = false 
		#pause.hide()
	#paused = !paused	
			#
func initiate_build_mode(tower_type):
	#if build_mode: CAN be used to fix my clone issue
		#return
	build_type = tower_type + "T1"
	var check_tower = load("res://" + build_type + ".tscn").instantiate()
	if check_tower.price> coins:
		print("moneyno")
		
	else:
		print("moneyyes")	
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
		#new_tower.area.hide()
		new_tower.built = true
		coins = coins - new_tower.price
		var butt = load("res://upgrade.tscn").instantiate()
		
		
		
			
func game_over():
	
		var game_scene = load("res://game_over.tscn").instantiate()
		add_child(game_scene)
		queue_free()


func _on_texture_button_pressed():
	await get_tree().create_timer(1).timeout
	enemy_spawn.reay=true
	reaa=true
	get_tree().paused =  false
	$UI/TextureButton.hide()

	

