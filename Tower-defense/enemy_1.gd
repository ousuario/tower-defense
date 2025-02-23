extends CharacterBody2D
@export var speed = 100
var health = 10
@onready var an = $AnimatedSprite2D
var dead = false
var point = 5
@onready var area = $Area2D


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		queue_free()
	if area.is_in_group("bullet"):
		var damage = area.damage
		hurt(damage)
	if area.is_in_group("ice"):
		var fast = speed
		speed = 50
		var damage = area.damage
		hurt(damage)
		await get_tree().create_timer(2.0).timeout
		speed = fast
		
		
		
		
func hurt(damage):
	health= health - damage
	if health >= 1:
		an.play("pain")
		await get_tree().create_timer(0.4).timeout
		
	if	health <= 0:
		die()
	if dead == false:	
		an.play("default")	

func die():
			dead = true
			speed = 0
			an.play("death")
			await get_tree().create_timer(0.6).timeout
			score()
			queue_free()



#func _on_animated_sprite_2d_animation_finished():
	#if an.animation == "pain":
		#queue_free()

func score():
	
	ScoreTracker.coins = ScoreTracker.coins + 1
	ScoreTracker.enemies_killed = ScoreTracker.enemies_killed+1
	ScoreTracker.score = ScoreTracker.score+1
	
	
