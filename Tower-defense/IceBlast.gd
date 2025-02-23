extends Area2D
var dir : float
var spawnPos : Vector2
var spawnRot : float
@onready var ani = $AnimatedSprite2D
var damage = 5



func _on_area_entered(area):
	if area.is_in_group("enemy"):
		await get_tree().create_timer(0.8).timeout
		queue_free()	
	
	
