extends Node2D
@onready var ice = $Ice
@onready var main = get_tree().get_root().get_node("main")
@onready var d_area = $DamageArea
@onready var damageshape = $DamageArea/DamageShape
@onready var are = $Area2D


var time = 2.0
@onready var cTimer = $CooldownTimer
var cooldown = false
var damage = 3
var enemyIn = false

func _on_cooldown_timer_timeout():
	cooldown=false
	
func _physics_process(delta):
	var overlaps = are.get_overlapping_areas()	
	for object in overlaps: if object.is_in_group("enemy"):
		if cooldown == false:
				damageshape.set_deferred("disabled", false)
				cooldown = true
				print("attack")
				cTimer.start()
				ice.play("boom")
				await get_tree().create_timer(0.4).timeout
				damageshape.set_deferred("disabled", true)
				ice.play("new_animation")
		



#func _on_area_2d_area_entered(area):
	#if area.is_in_group("enemy"):
		#if cooldown == false:
				#damageshape.set_deferred("disabled", false)
				#cooldown = true
				#print("attack")
				#cTimer.start()
				#ice.play("boom")
				#await get_tree().create_timer(0.4).timeout
				#damageshape.set_deferred("disabled", true)
				#ice.play("new_animation")
		#
#

