extends Node2D
@onready var main = get_tree().get_root().get_node("main")

@onready var BULLET = load("res://bullet.tscn")
@onready var cTimer = $CooldownTimer
var cooldown = false

func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		if cooldown == false:
			cooldown = true
			cTimer.start()
			var direction = (area.global_position - global_position).normalized()
			var bullet = BULLET.instantiate()
			#area.global_position += Vector2(direction*200) * delta
			bullet.spawnPos =area.global_position
			add_child(bullet)
			bullet.direction = direction
#

func _on_cooldown_timer_timeout():
	cooldown = false
