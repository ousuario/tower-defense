extends CharacterBody2D
@export var speed = 100
var health = 2
@onready var an = $AnimatedSprite2D

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
		
func hurt(damage):
	health= health - damage
	if health >= 1:
		an.play("pain")
		await get_tree().create_timer(0.4).timeout
		an.play("default")
	if	health <= 0:
		speed = 0
		an.play("death")
		await get_tree().create_timer(0.6).timeout
		queue_free()



#func _on_animated_sprite_2d_animation_finished():
	#if an.animation == "pain":
		#queue_free()


func _on_hit_box_area_shape_entered(area):
	if area.is_in_group("bullet"):
		print("pain")
