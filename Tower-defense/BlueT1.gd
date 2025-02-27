extends Node2D
@onready var ice = $Ice
@onready var main = get_tree().get_root().get_node("main")
@onready var d_area = $DamageArea
@onready var damageshape = $DamageArea/DamageShape
@onready var area = $Area2D
@onready var ICE = load("res://ice_blast.tscn")

var built = false
var time = 2.0
@onready var cTimer = $CooldownTimer
var cooldown = false
var damage = 3
var enemyIn = false
var enemy =false
var price = 6
var upgrade1 = false
var upgrade2 = false

func _on_cooldown_timer_timeout():
	cooldown=false

func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy") && built ==true:
		if cooldown == false:
			cooldown = true
			cTimer.start()
			var ice = ICE.instantiate()
			ice.spawnPos =area.global_position
			add_child(ice)
			if upgrade1==false:
				pass
			if upgrade1==true && upgrade2==false:
				pass
			if upgrade2==true:
				pass
			print(ice.damage)	


func _on_area_2d_area_exited(area):
	pass # Replace with function body.
	
func _on_texture_button_pressed():
	
	
	if upgrade2 == true && upgrade1== true:
		pass
	else:
		$Upgrade.show()	
