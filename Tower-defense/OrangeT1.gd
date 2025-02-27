extends Node2D
@onready var main = get_node("../..")
@onready var area = $Area2D
var built = false
var time = 2.0
@onready var cTimer = $CooldownTimer
var cash = 1
var price = 10
var upgrade_price1 = 15
var upgrade_price2 = 25
var coold = false
var upgrade1 = false
var upgrade2 = false


func _physics_process(delta):
	
		if built == true && coold ==false:
			cTimer.start()
			coold = true
			await get_tree().create_timer(1).timeout
			if upgrade1 == false:
				main.update_money()
			if upgrade1 == true && upgrade2 == false:
				main.money2()	
			if upgrade2==true:
				main.money3()	
	





func _on_cooldown_timer_timeout():
	coold = false


func _on_texture_button_pressed():
	if upgrade2 == true && upgrade1== true:
		pass
	else:
		$Upgrade.show()	




