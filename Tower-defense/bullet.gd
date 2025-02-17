extends Area2D
var dir : float
var spawnPos : Vector2
var spawnRot : float
@onready var ani = $AnimatedSprite2D
var damage = 5



@export var SPEED = 200
var exploded = false
## Called when the node enters the scene tree for the first time.
#func _ready():
	#global_position = spawnPos
	#global_rotation = spawnRot
	#

var direction: Vector2



func _process(delta):
	global_position += direction *SPEED * delta


func _on_area_entered(area):
		if area.is_in_group("enemy"):
			SPEED =0
			ani.play("die")
			await get_tree().create_timer(0.4).timeout
			queue_free()
			
		





