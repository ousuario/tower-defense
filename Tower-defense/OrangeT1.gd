extends Node2D
@onready var main = get_node("../..")
@onready var area = $Area2D
var built = false
var time = 2.0
@onready var cTimer = $CooldownTimer
var cash = 1
var price = 10
var coold = false

func _physics_process(delta):
	if built == true && coold ==false:
		cTimer.start()
		coold = true
		await get_tree().create_timer(1).timeout
		main.update_money()
		







func _on_cooldown_timer_timeout():
	coold = false
