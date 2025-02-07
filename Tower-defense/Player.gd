extends CharacterBody2D
@onready var playerAn = $AnimatedSprite2D

@onready var health = 10



func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		health = health-1
		playerAn.play("pain")
		#print(health)
		$Timer.start()
		
	




func _on_timer_timeout():
	playerAn.play("c")
