extends Node2D
@onready var main = get_tree().get_root().get_node("main")

@onready var BULLET = load("res://bullet.tscn")
@onready var cTimer = $CooldownTimer
var cooldown = false
var enemy_array = []
@onready var area = $Area2D
var built = false
var enemy
var enemy_alive = false
var price = 5

func _physics_process(delta):
	if enemy_array.size() != 0 && built == true:
		select_enemy()
		if cooldown == false:
			cTimer.start()
			cooldown = true
			shoot()
			
		
	else:	
		enemy = null
		

			
func shoot():
		var direction = (enemy.global_position - global_position).normalized()
		var bullet = BULLET.instantiate()
		#enemy.global_position += Vector2(direction*200) * delta
		bullet.spawnPos = enemy.global_position
		add_child(bullet)
		bullet.direction = direction
		
		
#func select_enemy():
	#var enemy_progress_array = []
	#for i in enemy_array:
		#enemy_progress_array.append(i.progress) 
	#var max_offset = enemy_progress_array.max()
	#var enemy_index = enemy_progress_array.find(max_offset)
	#enemy = enemy_array[enemy_index]
func kill():
	enemy_array.erase(enemy)	
	
func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.progress) 
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]	

#func _on_area_2d_area_entered(area):
	#if area.is_in_group("enemy"):
		#if cooldown == false:
			#cooldown = true
			#cTimer.start()
			#var direction = (area.global_position - global_position).normalized()
			#var bullet = BULLET.instantiate()
			##area.global_position += Vector2(direction*200) * delta
			#bullet.spawnPos =area.global_position
			#add_child(bullet)
			#bullet.direction = direction
##

func _on_cooldown_timer_timeout():
	cooldown = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy") && built == true:
		enemy_array.append(body.get_parent())
		




func _on_area_2d_body_exited(body):
	if body.is_in_group("enemy") && built == true:
		kill()
