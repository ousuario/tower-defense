extends Node2D

@onready var path = preload("res://path1.tscn")
@onready var path2 = preload ("res://path_2.tscn")
var rng = RandomNumberGenerator.new()



func _on_timer_timeout():
	var num = rng.randf_range(1, 10)
	print(num)
	if num >= 6:
		var fauxpath = path.instantiate()
		add_child(fauxpath)
	if num < 6:
		var fauxpath = path2.instantiate()
		add_child(fauxpath)
		
