extends Area2D
var dir : float
var spawnPos : Vector2
var spawnRot : float
@onready var ani = $AnimatedSprite2D
var damage = 2



func _on_area_entered(area):
	if area.is_in_group("enemy"):
		await get_tree().create_timer(1).timeout
		queue_free()	
	
	
